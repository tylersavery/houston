import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/base_screen.dart';
import '../forms/widgets/verification_form.dart';

class VerificationScreen extends BaseScreen {
  static String route() => "/email";

  const VerificationScreen({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: VerificationForm(),
    );
  }
}
