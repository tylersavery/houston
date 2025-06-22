import 'package:flutter/material.dart';

class Toast {
  static void message(BuildContext context, String content) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(content)));
  }
}
