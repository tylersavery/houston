import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/movie/presentation/screens/movie_list_screen.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../screens/register_screen.dart';
import '../../providers/auth_provider.dart';
import '../../providers/auth_state.dart';
import '../providers/login_form_provider.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final provider = ref.read(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (previous is AuthStateSuccess || next is AuthStateSuccess) {
        context.go(MovieListScreen.route());
      }

      if (next is AuthStateFailure) {
        Toast.message(context, next.message);
      }
    });
    switch (state) {
      case AuthStateLoading():
      case AuthStateBooting():
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
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const Text(
                'Sign In.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: provider.emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: provider.passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
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
                  context.go(RegisterScreen.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
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

      default:
        return const SizedBox();
    }
  }
}
