import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spriver_flutter/core/widgets/base_screen.dart';
import 'package:spriver_flutter/features/auth/presentation/forms/widgets/register_form.dart';

class RegisterScreen extends BaseScreen {
  static String route() => "/register";

  const RegisterScreen({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: RegisterForm(),
    );
  }
}
