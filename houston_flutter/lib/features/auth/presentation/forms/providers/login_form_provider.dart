import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';

class LoginFormProvider {
  final Ref ref;

  LoginFormProvider(this.ref);

  final emailController = TextEditingController(text: "tyler@tylersavery.com");
  final passwordController = TextEditingController(text: "younotry");
  final formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email Required";
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

    ref.read(authProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
        );
  }
}

final loginFormProvider = Provider.autoDispose<LoginFormProvider>((ref) {
  return LoginFormProvider(ref);
});
