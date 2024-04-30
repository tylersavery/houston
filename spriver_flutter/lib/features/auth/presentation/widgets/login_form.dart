import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/core/common/widgets/loader.dart';
import 'package:spriver_flutter/core/utils/show_snackbar.dart';
import 'package:spriver_flutter/features/auth/presentation/pages/register_page.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/auth_provider.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/auth_state.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/login_form_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_list_page.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final provider = ref.read(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (previous is AuthStateSuccess) {
        context.go(MovieListPage.route());
      }

      if (next is AuthStateFailure) {
        showSnackBar(context, next.message);
      }

      if (next is AuthStateSuccess) {
        context.go(MovieListPage.route());
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
              if (state is AuthStateFailure)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.message,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: provider.emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: provider.passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: provider.submit,
                child: const Text("Login"),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go(RegisterPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
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
