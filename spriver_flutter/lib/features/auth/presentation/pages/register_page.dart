import 'package:flutter/material.dart';
import 'package:spriver_flutter/features/auth/presentation/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  static String route() => "/register";

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: RegisterForm(),
      ),
    );
  }
}
