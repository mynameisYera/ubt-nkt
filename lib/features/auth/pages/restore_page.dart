import 'package:brand_test/features/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:brand_test/config/getit/get_injection.dart';
import 'package:brand_test/config/route/go_router_help.dart';
import 'package:brand_test/config/widgets/app_button.dart';
import 'package:brand_test/config/widgets/app_text_field.dart';
import 'package:brand_test/config/widgets/error_message_widget.dart';
import 'package:brand_test/features/auth/pages/bloc/auth_bloc.dart';

class RestorePage extends StatefulWidget {
  const RestorePage({super.key});

  @override
  State<RestorePage> createState() => _RestorePageState();
}

class _RestorePageState extends State<RestorePage> {
  late AuthBloc _authBloc;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _isLoadingOtp = false;
  bool _otpSended = false;
  bool _isFormValid = false;
  bool isException = false;
  String errorMessage = "Белгісіз қателік, кейінірек қайталап көріңіз";

  @override
  void initState() {
    super.initState();
    _authBloc = sl<AuthBloc>();
    _phoneController.addListener(_validateForm);
    _codeController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    if (!_otpSended) {
      final isValid = _phoneController.text.isNotEmpty;
      if (isValid != _isFormValid) {
        setState(() {
          _isFormValid = isValid;
        });
      }
    } else {
      final isValid = 
          _codeController.text.length == 6 &&
          _passwordController.text.length >= 8 &&
          _passwordController.text == _confirmPasswordController.text;
      if (isValid != _isFormValid) {
        setState(() {
          _isFormValid = isValid;
        });
      }
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

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _sendOtp() {
    if (_phoneController.text.isEmpty) return;
    
    setState(() {
      _isLoadingOtp = true;
    });

    _authBloc.add(
      AuthEvent.restorePasswordOtp(
        phone: "+7${_phoneController.text.replaceAll(RegExp(r'[^\d]'), '')}",
      ),
    );
  }

  void _restorePassword() {
    if (!_isFormValid) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      exception('Пароли не совпадают');
      return;
    }

    _authBloc.add(
      AuthEvent.restorePassword(
        phone: "+7${_phoneController.text.replaceAll(RegExp(r'[^\d]'), '')}",
        code: _codeController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => appRouter.pop(),
        ),
      ),
      body: BlocProvider.value(
        value: _authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                if (!_otpSended) {
                  setState(() => _isLoadingOtp = true);
                } else {
                  setState(() => _isLoading = true);
                }
              },
              resetPasswordOtpSended: () {
                setState(() {
                  _isLoadingOtp = false;
                  _otpSended = true;
                  _isFormValid = false;
                });
                _validateForm();
                _showSuccess('Код отправлен на ваш номер телефона');
              },
              resetPasswordOtpFailure: (message) {
                exception(message);
              },
              resetPasswordFailure: (message) {
                exception(message);
              },
              loaded: () {
                setState(() => _isLoading = false);
                _showSuccess('Пароль успешно изменен');
                Future.delayed(const Duration(seconds: 1), () {
                  appRouter.pushReplacement('/login');
                });
              },
              orElse: () {},
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
                      'Құпия сөзіңізді қалпына келтіру',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _otpSended
                          ? 'SMS кодын және жаңа құпия сөзді енгізіңіз'
                          : 'Телефон нөміріңізді енгізіңіз',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 32),
                    if (!_otpSended) ...[
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
                      const SizedBox(height: 24),
                      AppButton(
                        text: 'Кодты жіберу',
                        icon: Icons.send,
                        isLoading: _isLoadingOtp,
                        isDisabled: !_isFormValid,
                        onPressed: _sendOtp,
                      ),
                      const SizedBox(height: 16),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOutCirc,
                        child: isException && !_otpSended
                            ? ErrorMessageWidget(
                                key: const ValueKey("error"),
                                message: errorMessage,
                              )
                            : const SizedBox(key: ValueKey("empty")),
                      ),
                    ] else ...[
                      AppTextField(
                        controller: _phoneController,
                        prefixText: '+7 ',
                        labelText: 'Телефон нөмірі',
                        hintText: '777 777-77-77',
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone),
                        enabled: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                          PhoneNumberFormatter(),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: _codeController,
                        labelText: 'SMS коды',
                        hintText: '6 цифр',
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: _passwordController,
                        labelText: 'Жаңа құпия сөз',
                        hintText: 'Жаңа құпия сөзді енгізіңіз',
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: _confirmPasswordController,
                        labelText: 'Құпия сөзді растау',
                        hintText: 'Құпия сөзді растаңыз',
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        text: 'Құпия сөзді өзгерту',
                        icon: Icons.check,
                        isLoading: _isLoading,
                        isDisabled: !_isFormValid,
                        onPressed: _restorePassword,
                      ),
                      const SizedBox(height: 16),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOutCirc,
                        child: isException && _otpSended
                            ? ErrorMessageWidget(
                                key: const ValueKey("error"),
                                message: errorMessage,
                              )
                            : const SizedBox(key: ValueKey("empty")),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _otpSended = false;
                            _codeController.clear();
                            _passwordController.clear();
                            _confirmPasswordController.clear();
                            _isFormValid = false;
                            isException = false;
                          });
                          _validateForm();
                        },
                        child: const Text('Басқа нөмірді енгізу'),
                      ),
                    ],
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