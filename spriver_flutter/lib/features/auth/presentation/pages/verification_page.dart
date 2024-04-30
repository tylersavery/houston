import 'package:flutter/material.dart';
import 'package:spriver_flutter/features/auth/presentation/widgets/verification_form.dart';

class VerificationPage extends StatelessWidget {
  static String route() => "/email";

  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: VerificationForm(),
      ),
    );
  }
}
