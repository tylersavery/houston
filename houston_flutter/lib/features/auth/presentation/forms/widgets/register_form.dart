import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/movie/presentation/screens/movie_list_screen.dart';
import '../../../../../core/widgets/loader.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../screens/login_screen.dart';
import '../../screens/verification_screen.dart';
import '../../providers/auth_provider.dart';
import '../../providers/auth_state.dart';
import '../providers/register_form_provider.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(registerFormProvider);
    final state = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next is AuthStateFailure) {
        Toast.message(context, next.message);
      }
      if (next is AuthStateSuccess) {
        context.go(MovieListScreen.route());
      }

      if (next is AuthStateVerificationRequired) {
        context.go(VerificationScreen.route());
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
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: provider.emailController,
                validator: provider.emailValidator,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: provider.usernameController,
                validator: provider.usernameValidator,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: provider.passwordController,
                validator: provider.passwordValidator,
                decoration: const InputDecoration(hintText: 'Password'),
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
                  context.go(LoginScreen.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign In',
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
