import 'package:flutter/material.dart';
import 'package:spriver_flutter/features/auth/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static String route() => "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: LoginForm(),
      ),
    );
  }
}
