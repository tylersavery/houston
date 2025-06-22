import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Widget? leading;
  final IconData? icon;

  const EmptyPlaceholder({
    required this.title,
    this.trailing,
    this.leading,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) leading!,
            const SizedBox(height: 32),
            Icon(icon ?? Icons.new_releases, size: 46),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
