import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/config/widgets/app_button.dart';
import 'package:ubt_pbb/config/widgets/app_text_field.dart';
import 'package:ubt_pbb/config/getit/get_injection.dart';
import 'package:ubt_pbb/config/widgets/error_message_widget.dart';
import 'package:ubt_pbb/features/auth/models/login_request.dart';
import 'package:ubt_pbb/features/auth/pages/bloc/auth_bloc.dart';
import 'package:ubt_pbb/config/route/go_router_help.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isFormValid = false;
  bool isException = false;
  String errorMessage = "Белгісіз қателік, кейінірек қайталап көріңіз";

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid =
        _phoneController.text.isNotEmpty && 
        _passwordController.text.length >= 8 && 
        _passwordController.text.length <= 20;
    if (isValid != _isFormValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  void exception(String message) {
    setState(() {
      _isLoading = false;
      isException = true;
      errorMessage = message;
      _phoneController.clear();
      _passwordController.clear();
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() {
        isException = false;
        errorMessage = "Белгісіз қателік, кейінірек қайталап көріңіз";
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    final authBloc = sl<AuthBloc>();
    debugPrint('AuthBloc instance: ${authBloc.hashCode}');
    debugPrint('Current AuthState: ${authBloc.state}');
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider.value(
        value: authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            debugPrint('AuthState changed: ${state.runtimeType}');
            state.maybeWhen(
              orElse: () {
                debugPrint('AuthState: orElse');
              },
              initial: () {
                debugPrint('AuthState: initial');
              },
              loading: () {
                debugPrint('AuthState: loading');
                setState(() => _isLoading = true);
              },
              loadingFailure: (message) {
                debugPrint('AuthState: loadingFailure - $message');
                exception(message);
              },
              loaded: () {
                debugPrint('AuthState: loaded - navigating to home');
                setState(() => _isLoading = false);
                // Небольшая задержка для гарантии сохранения токенов
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (mounted) {
                    appRouter.pushReplacement('/home');
                  }
                });
              },
            );
          },

          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Қош келдіңіз',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Телефон нөмірін және парольді енгізіңіз',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
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
                        _PhoneNumberFormatter(),
                      ],
                    ),
                    const SizedBox(height: 16),
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
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      text: 'Кіру',
                      icon: Icons.login,
                      // isLoading: _isLoading,
                      isDisabled: !_isFormValid,
                      onPressed: _isLoading
                          ? null
                          : () {
                              debugPrint('Login button pressed');
                              final phoneNumber = _phoneController.text.replaceAll(RegExp(r'[^\d]'), '');
                              final fullPhoneNumber = '+7$phoneNumber';
                              debugPrint('Phone: $fullPhoneNumber');
                              debugPrint('Password: ${_passwordController.text.isNotEmpty ? "***" : "empty"}');
                              sl<AuthBloc>().add(
                                AuthEvent.login(
                                  loginRequest: LoginRequest(
                                    phone: fullPhoneNumber, 
                                    password: _passwordController.text
                                  )
                                ),
                              );
                            },
                    ),
                    const SizedBox(height: 16),   
                    AppButton(
                      text: 'Құпия сөзіңізді қалпына келтіру',
                      icon: Icons.lock,
                      onPressed: () {
                        appRouter.push("/restore");
                      },
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            appRouter.push("/register");
                          },
                          child: const Text(
                            "Тіркеліңіз",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.mainBlue,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.mainBlue
                            ),
                          ),
                        ),
                      ],
                    ),
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
          )
      ),
    )
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    if (text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    
    String formatted = '';
    if (text.length <= 3) {
      formatted = text;
    } else if (text.length <= 6) {
      formatted = '${text.substring(0, 3)} ${text.substring(3)}';
    } else if (text.length <= 8) {
      formatted = '${text.substring(0, 3)} ${text.substring(3, 6)}-${text.substring(6)}';
    } else {
      formatted = '${text.substring(0, 3)} ${text.substring(3, 6)}-${text.substring(6, 8)}-${text.substring(8, 10)}';
    }
    
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
