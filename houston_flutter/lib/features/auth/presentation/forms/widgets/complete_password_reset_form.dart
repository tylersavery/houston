import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/auth/presentation/forms/providers/complete_password_reset_form_provider.dart';
import 'package:houston_flutter/features/movie/presentation/screens/movie_list_screen.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../providers/auth_provider.dart';
import '../../providers/auth_state.dart';

class CompletePasswordResetForm extends ConsumerWidget {
  const CompletePasswordResetForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(completePasswordResetFormProvider);
    final state = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next is AuthStateFailure) {
        Toast.message(context, next.message);
      }
      if (next is AuthStateSuccess) {
        context.go(MovieListScreen.route());
      }
    });

    switch (state) {
      case AuthStatePasswordResetRequested():
        return Form(
          key: provider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Verify Email',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Check your email for a verificaiton code",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              TextFormField(
                autofocus: true,
                controller: provider.verificationCodeController,
                validator: provider.verificationCodeValidator,
                decoration: const InputDecoration(
                  hintText: 'Verification Code',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: provider.passwordController,
                validator: provider.passwordValidator,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'New Password'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.submit(state.email);
                },
                child: const Text("Submit"),
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
      case AuthStateInitial():
      case AuthStateBooting():
      case AuthStateLoading():
      case AuthStateVerificationRequired():
      case AuthStateSuccess():
      case AuthStateFailure():
        return const SizedBox();
    }
  }
}
