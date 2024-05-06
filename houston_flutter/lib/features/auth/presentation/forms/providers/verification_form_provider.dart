import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_confirm_registration_usecase.dart';
import '../../providers/auth_provider.dart';

class VerificationFormProvider {
  final Ref ref;

  VerificationFormProvider(this.ref);

  final verificationCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? verificationCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Verification Code Required";
    }

    return null;
  }

  Future<void> submit(String email, String password) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    ref.read(authProvider.notifier).confirmRegistration(
          UserConfirmRegistrationParams(
            email: email,
            verificationCode: verificationCodeController.text,
            password: password,
          ),
        );
  }
}

final verificationFormProvider = Provider.autoDispose<VerificationFormProvider>((ref) {
  return VerificationFormProvider(ref);
});
