import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/auth/presentation/forms/providers/request_password_reset_form_provider.dart';
import 'package:houston_flutter/features/auth/presentation/screens/complete_password_reset_screen.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../providers/auth_provider.dart';
import '../../providers/auth_state.dart';

class RequestPasswordResetForm extends ConsumerWidget {
  const RequestPasswordResetForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(requestPasswordResetFormProvider);
    final state = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next is AuthStateFailure) {
        Toast.message(context, next.message);
      }
      if (next is AuthStatePasswordResetRequested) {
        context.go(CompletePasswordResetScreen.route());
      }
    });

    switch (state) {
      case AuthStateInitial():
        return Form(
          key: provider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Reset Password',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "We'll send you and email with a recovery code!",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              TextFormField(
                autofocus: true,
                controller: provider.emailController,
                validator: provider.emailValidator,
                decoration: const InputDecoration(hintText: 'Email Address'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.submit();
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      case AuthStatePasswordResetRequested():
      case AuthStateBooting():
      case AuthStateLoading():
      case AuthStateVerificationRequired():
      case AuthStateSuccess():
      case AuthStateFailure():
        return const SizedBox();
    }
  }
}
