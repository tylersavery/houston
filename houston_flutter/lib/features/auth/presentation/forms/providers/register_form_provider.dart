import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_register_usecase.dart';
import '../../providers/auth_provider.dart';

class RegisterFormProvider {
  final Ref ref;

  RegisterFormProvider(this.ref);

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email Required";
    }

    return null;
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username Required";
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password Required";
    }

    return null;
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    ref.read(authProvider.notifier).register(
          UserRegisterParams(
            email: emailController.text.trim(),
            username: usernameController.text.trim(),
            password: passwordController.text,
          ),
        );
  }
}

final registerFormProvider = Provider.autoDispose<RegisterFormProvider>((ref) {
  return RegisterFormProvider(ref);
});
