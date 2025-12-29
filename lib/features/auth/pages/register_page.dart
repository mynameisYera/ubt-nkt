import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/config/endpoints/dio_sender.dart';
import 'package:ubt_pbb/config/endpoints/endpoints.dart';
import 'package:ubt_pbb/config/widgets/app_button.dart';
import 'package:ubt_pbb/config/widgets/app_text_field.dart';
import 'package:ubt_pbb/config/getit/get_injection.dart';
import 'package:ubt_pbb/config/route/go_router_help.dart';
import 'package:ubt_pbb/config/widgets/dropdown_widget.dart';
import 'package:ubt_pbb/features/auth/pages/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _schoolOtherController = TextEditingController();
  
  String _role = 'student';
  int? _schoolId;

  bool _isLoading = false;
  bool _isLoadingOtp = false;
  bool _isFormValid = false;
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = sl<AuthBloc>();
    _authBloc.add(const AuthEvent.getSchools());
    _phoneController.addListener(_validateForm);
    _codeController.addListener(_validateForm);
    _firstNameController.addListener(_validateForm);
    _lastNameController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid = 
        _phoneController.text.isNotEmpty &&
        _codeController.text.length == 6 &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _passwordController.text.length >= 8;
    if (isValid != _isFormValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    setState(() { _isLoading = false; _isLoadingOtp = false;});
  }

  void _sendOtp() async{
    if (_phoneController.text.isEmpty) return;
    setState(() {
      _isLoadingOtp = true;
    });
    try {
      final response = await DioSender.post(
        Endpoints.requestOtp,
        {
          "phone": _phoneController.text,
        }
      );
      if(response.statusCode == 200){
        setState(() {
          _isLoadingOtp = false;
        });
      }else{
        setState(() {
          _isLoadingOtp = false;
        });
      }
    } on ApiException catch (e) {
      _showError(e.message);
    } on DioException catch (e) {
      // Обработка DioException для случаев, когда ошибка не была обработана в DioSender
      if (e.response?.statusCode == 429) {
        final data = e.response?.data;
        if (data is Map && data['error'] == 'otp_rate_limited') {
          _showError('Кейінірек байқап көріңіз');
        } else {
          _showError('Кейінірек байқап көріңіз');
        }
      } else {
        _showError('Ошибка сети, попробуйте ещё раз');
      }
    } catch (e) {
      _showError('Ошибка, попробуйте ещё раз');
    }
  }

  void _register() {
    if (!_isFormValid) return;

    _authBloc.add(
      AuthEvent.register(
        phone: _phoneController.text,
        code: _codeController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        password: _passwordController.text,
        role: _role,
        schoolId: _schoolId ?? 0,
        schoolOtherName: _schoolOtherController.text,
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _schoolOtherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider.value(
        value: _authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              initial: () => _isLoading = false,
              loading: () => setState(() => _isLoading = true),
              loadingFailure: (message) => _showError(message),
              loaded: () {
                setState(() => _isLoading = false);
                appRouter.pushReplacement('/login');
              },
              otpSended: () {
                setState(() => _isLoadingOtp = false);
              },
              orElse: () {
              },
            );
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Тіркеліңіз',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _phoneController,
                      labelText: 'Телефон нөмірі',
                      hintText: '+7 777 777-77-77',
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    const SizedBox(height: 12),
                    AppButton(
                      text: 'Кодты жіберу',
                      icon: Icons.send,
                      isLoading: _isLoadingOtp,
                      onPressed: _sendOtp,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _codeController,
                      labelText: 'SMS коды',
                      hintText: '6 цифр',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    AppTextField(
                      controller: _firstNameController,
                      labelText: 'Имя',
                    ),
                    const SizedBox(height: 12),
                    AppTextField(
                      controller: _lastNameController,
                      labelText: 'Фамилия',
                    ),
                    const SizedBox(height: 12),
                    AppTextField(
                      controller: _passwordController,
                      labelText: 'Пароль',
                      hintText: 'Парольді енгізіңіз',
                      obscureText: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                    ),
                    const SizedBox(height: 12),
                    styledDropdown<String>(
                      label: "Роль",
                      value: _role,
                      items: const [
                        DropdownMenuItem(value: 'student', child: Text('Оқушы')),
                        DropdownMenuItem(value: 'teacher', child: Text('Мұғалім')),
                      ],
                      onChanged: (value) => setState(() => _role = value ?? 'student'),
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<AuthBloc, AuthState>(
                      bloc: _authBloc,
                      builder: (context, state) {
                        return state.maybeWhen(
                          loadingSchools: (){
                            return Container(
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(color: AppColors.mainBlue,),
                              ),
                            );
                          },
                          loadedSchools: (schoolsResp) {
                            final schools = schoolsResp.results;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                styledDropdown<String>(
                                  value: _schoolId?.toString(),
                                  hint: const Text("Выберите школу"),
                                  // isExpanded: true,
                                  items: [
                                    ...schools.map(
                                      (s) => DropdownMenuItem(
                                        value: s.id.toString(),
                                        child: Text(s.name),
                                      ),
                                    ),

                                    const DropdownMenuItem(
                                      value: "other",
                                      child: Text("Нет моей школы"),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == "other") {
                                        _schoolId = null;
                                      } else {
                                        _schoolId = int.tryParse(value ?? "");
                                      }
                                    });
                                  },
                                  label: "Школа"
                                ),

                                const SizedBox(height: 10),

                                if (_schoolId == null)
                                  AppTextField(
                                    controller: _schoolOtherController,
                                    labelText: "Введите название школы",
                                  ),
                              ],
                            );
                          },
                          
                          orElse: () => const SizedBox(),
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                    AppButton(
                      text: 'Зарегистрироваться',
                      icon: Icons.check,
                      isDisabled: !_isFormValid,
                      isLoading: _isLoading,
                      onPressed: _register,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
