import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/core/utils/validation_utils.dart';
import '../../providers/auth_provider.dart';

class RequestPasswordResetFormProvider {
  final Ref ref;

  RequestPasswordResetFormProvider(this.ref);

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) =>
      ValidationUtils.formValidatorEmail(value);

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    ref
        .read(authProvider.notifier)
        .requestPasswordReset(email: emailController.text);
  }
}

final requestPasswordResetFormProvider =
    Provider.autoDispose<RequestPasswordResetFormProvider>((ref) {
      return RequestPasswordResetFormProvider(ref);
    });
