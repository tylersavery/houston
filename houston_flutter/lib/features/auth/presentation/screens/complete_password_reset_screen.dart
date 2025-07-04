import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/features/auth/presentation/forms/widgets/complete_password_reset_form.dart';
import 'package:houston_flutter/features/auth/presentation/forms/widgets/request_password_reset_form.dart';
import '../../../../core/widgets/base_screen.dart';
import '../forms/widgets/verification_form.dart';

class CompletePasswordResetScreen extends BaseScreen {
  static String route() => "/reset-password/complete";

  const CompletePasswordResetScreen({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CompletePasswordResetForm(),
    );
  }
}
