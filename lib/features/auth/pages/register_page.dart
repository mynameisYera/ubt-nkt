import 'package:brand_test/features/auth/pages/login_page.dart';
import 'package:brand_test/features/home/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:brand_test/config/constants/app_colors.dart';
import 'package:brand_test/config/endpoints/dio_sender.dart';
import 'package:brand_test/config/endpoints/endpoints.dart';
import 'package:brand_test/config/widgets/app_button.dart';
import 'package:brand_test/config/widgets/app_text_field.dart';
import 'package:brand_test/config/getit/get_injection.dart';
import 'package:brand_test/config/route/go_router_help.dart';
import 'package:brand_test/config/widgets/dropdown_widget.dart';
import 'package:brand_test/config/widgets/error_message_widget.dart';
import 'package:brand_test/features/auth/pages/bloc/auth_bloc.dart';
import 'package:brand_test/features/auth/models/schools_model.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

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
  List<School>? _schools;
  bool _isLoadingSchools = false;

  bool _isLoading = false;
  bool _isLoadingOtp = false;
  bool _isFormValid = false;
  bool isException = false;
  String errorMessage = "Белгісіз қателік, кейінірек қайталап көріңіз";
  late AuthBloc _authBloc;
  bool _isPasswordVisible = false;  
  ContactModel? _contactModel;

  Future<void> _loadContact() async {
    final contactResponse = await DioSender.get(
      Endpoints.getSupportContact,
    );
    final contactData = contactResponse.data as Map<String, dynamic>;
    setState(() {
      _contactModel = ContactModel.fromJson(contactData);
    });
  }

  Future<void> openLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Некорректная ссылка')),
        );
      }
      return;
    }

    final canLaunch = await canLaunchUrl(uri);
    if (!canLaunch) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Не удалось открыть ссылку')),
        );
      }
      return;
    }

    final launched = await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
      webOnlyWindowName: '_blank',
    );
    if (!launched && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось открыть ссылку')),
      );
    }
  }

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
    _loadContact();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
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

  void exception(String message) {
    setState(() {
      _isLoading = false;
      _isLoadingOtp = false;
      isException = true;
      errorMessage = message;
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() {
        isException = false;
        errorMessage = "Белгісіз қателік, кейінірек қайталап көріңіз";
      });
    });
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
          "phone": "+7${_phoneController.text.replaceAll(RegExp(r'[^\d]'), '')}",
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
      exception(e.message);
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        final data = e.response?.data;
        if (data is Map && data['error'] == 'otp_rate_limited') {
          exception('Кейінірек байқап көріңіз');
        } else {
          exception('Кейінірек байқап көріңіз');
        }
      } else {
        exception('Ошибка сети, попробуйте ещё раз');
      }
    } catch (e) {
      exception('Ошибка, попробуйте ещё раз');
    }
  }

  void _register() {
    if (!_isFormValid) return;

    _authBloc.add(
      AuthEvent.register(
        phone: "+7${_phoneController.text.replaceAll(RegExp(r'[^\d]'), '')}",
        code: _codeController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        password: _passwordController.text,
        role: _role,
        schoolId: _schoolId ?? 0,
        schoolOtherName: '',
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
              loadingFailure: (message) => exception(message),
              loaded: () {
                setState(() => _isLoading = false);
                appRouter.pushReplacement('/login');
              },
              otpSended: () {
                setState(() => _isLoadingOtp = false);
              },
              loadingSchools: () {
                setState(() => _isLoadingSchools = true);
              },
              loadedSchools: (schoolsResp) {
                setState(() {
                  _schools = schoolsResp.results;
                  _isLoadingSchools = false;
                });
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
                      hintText: '777 777-77-77',
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone),
                      prefixText: '+7 ',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                        PhoneNumberFormatter(),
                      ],
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      obscureText: !_isPasswordVisible,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          _togglePasswordVisibility();
                        },
                      ),
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
                    _isLoadingSchools
                        ? Container(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(color: AppColors.mainBlue,),
                            ),
                          )
                        : _schools != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  styledDropdown<String>(
                                    value: _schoolId?.toString(),
                                    hint: const Text("Выберите школу"),
                                    // isExpanded: true,
                                    items: [
                                      ..._schools!.map(
                                        (s) => DropdownMenuItem(
                                          value: s.id.toString(),
                                          child: Text(s.name),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _schoolId = int.tryParse(value ?? "");
                                      });
                                    },
                                    label: "Школа"
                                  ),

                                  const SizedBox(height: 10),
                                ],
                              )
                            : const SizedBox(),

                    const SizedBox(height: 24),
                    AppButton(
                      text: 'Зарегистрироваться',
                      icon: Icons.check,
                      isDisabled: !_isFormValid,
                      isLoading: _isLoading,
                      onPressed: _register,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            openLink(_contactModel!.whatsappUrl);
                          },
                          child: Text('Тіркелу кезінде қателік байқадыңыз ба?', style: TextStyle(color: AppColors.mainBlue, decoration: TextDecoration.underline, decorationColor: AppColors.mainBlue),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOutCirc,
                      child: isException
                          ? ErrorMessageWidget(
                              key: const ValueKey("error"),
                              message: errorMessage,
                            )
                          : const SizedBox(key: ValueKey("empty")),
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
