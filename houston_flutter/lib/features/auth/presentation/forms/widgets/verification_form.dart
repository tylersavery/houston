import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/core/router/app_router.dart';
import '../../../../../core/utils/debugger_utils.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../providers/auth_provider.dart';
import '../../providers/auth_state.dart';
import '../providers/verification_form_provider.dart';

class VerificationForm extends ConsumerWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(verificationFormProvider);
    final state = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next is AuthStateFailure) {
        Toast.message(context, next.message);
      }
      if (next is AuthStateSuccess) {
        context.go(DEFAULT_ROUTE);
      }
    });

    switch (state) {
      case AuthStateBooting():
      case AuthStateInitial():
      case AuthStatePasswordResetRequested():
      case AuthStateSuccess():
        return const SizedBox();
      case AuthStateLoading():
        return const Loader();
      case AuthStateFailure():
        return Center(child: Text(state.message));
      case AuthStateVerificationRequired():
        return Form(
          key: provider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Confirm Email.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Check your email for a verification code!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: provider.verificationCodeController,
                validator: provider.verificationCodeValidator,
                decoration: const InputDecoration(
                  hintText: 'Verification Code',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.submit(state.email, state.password);
                },
                child: const Text("Verify"),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final success = await ref
                      .read(authProvider.notifier)
                      .resendEmailVerificationCode(email: state.email);

                  if (context.mounted) {
                    if (success) {
                      Toast.message(context, "Verification code sent!");
                    } else {
                      Toast.error(context, "A problem ocurred");
                    }
                  }
                },
                child: RichText(
                  text: TextSpan(
                    text: "Didn't receive a code? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Resend',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
