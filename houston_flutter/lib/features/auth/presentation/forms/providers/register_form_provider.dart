import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';

class RegisterFormProvider {
  final Ref ref;

  RegisterFormProvider(this.ref);

  final emailController = TextEditingController(text: "tyler2@tylersavery.com");
  final usernameController = TextEditingController(text: "tyler");
  final passwordController = TextEditingController(text: "younotry");
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

    ref
        .read(authProvider.notifier)
        .register(
          email: emailController.text.trim(),
          username: usernameController.text.trim(),
          password: passwordController.text,
        );
  }
}

final registerFormProvider = Provider.autoDispose<RegisterFormProvider>((ref) {
  return RegisterFormProvider(ref);
});
