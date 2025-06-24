import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/core/utils/validation_utils.dart';
import '../../providers/auth_provider.dart';

class CompletePasswordResetFormProvider {
  final Ref ref;

  CompletePasswordResetFormProvider(this.ref);

  final verificationCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? verificationCodeValidator(String? value) =>
      ValidationUtils.formValidatorNotEmpty(value, "Verification Code");

  String? passwordValidator(String? value) =>
      ValidationUtils.formValidatorPassword(value);

  Future<void> submit(String email) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    ref
        .read(authProvider.notifier)
        .completePasswordReset(
          email: email,
          verificationCode: verificationCodeController.text,
          newPassword: passwordController.text,
        );
  }
}

final completePasswordResetFormProvider =
    Provider.autoDispose<CompletePasswordResetFormProvider>((ref) {
      return CompletePasswordResetFormProvider(ref);
    });
