import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spriver_flutter/core/utils/screen_utils.dart';

abstract class BaseComponent extends ConsumerWidget {
  const BaseComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (ScreenUtils.size(context)) {
      case ScreenSize.lg:
        return bodyLg(context, ref);
      case ScreenSize.md:
        return bodyMd(context, ref);
      case ScreenSize.sm:
        return body(context, ref);
    }
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return const SizedBox.shrink();
  }

  Widget bodyMd(BuildContext context, WidgetRef ref) {
    return body(context, ref);
  }

  Widget bodyLg(BuildContext context, WidgetRef ref) {
    return bodyMd(context, ref);
  }
}
