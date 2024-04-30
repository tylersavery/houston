import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/core/common/widgets/loader.dart';
import 'package:spriver_flutter/core/utils/show_snackbar.dart';
import 'package:spriver_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:spriver_flutter/features/auth/presentation/pages/verification_page.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/auth_provider.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/auth_state.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/register_form_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_list_page.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(registerFormProvider);
    final state = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next is AuthStateFailure) {
        showSnackBar(context, next.message);
      }
      if (next is AuthStateSuccess) {
        context.go(MovieListPage.route());
      }

      if (next is AuthStateVerificationRequired) {
        context.go(VerificationPage.route());
      }
    });

    switch (state) {
      case AuthStateLoading():
        return const Loader();
      case AuthStateFailure():
      case AuthStateInitial():
        return Form(
          key: provider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: provider.emailController,
                validator: provider.emailValidator,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: provider.usernameController,
                validator: provider.usernameValidator,
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: provider.passwordController,
                validator: provider.passwordValidator,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: provider.submit,
                child: const Text("Register"),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go(LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
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

      default:
        return const SizedBox();
    }
  }
}
