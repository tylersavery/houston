import 'package:flutter/material.dart';
import 'package:houston_flutter/core/theme/theme.dart';

class Toast {
  static void message(BuildContext context, String content) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(content)));
  }

  static void error(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: TextStyle(color: Theme.of(context).colorScheme.dangerButtonFg),
        ),
        backgroundColor: Theme.of(context).colorScheme.dangerButtonBg,
      ),
    );
  }
}
