import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/screen_utils.dart';
import 'navigation/main_drawer.dart';

abstract class BaseScreen extends ConsumerWidget {
  final double verticalPadding;
  final double horizontalPadding;
  final bool includeMainDrawer;

  const BaseScreen({
    super.key,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 8.0,
    this.includeMainDrawer = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ScreenUtils.size(context) == ScreenSize.lg
          ? appBarLg(context, ref)
          : ScreenUtils.size(context) == ScreenSize.md
              ? appBarMd(context, ref)
              : appBar(context, ref),
      drawer: includeMainDrawer && ScreenUtils.atMost(context, ScreenSize.sm) ? const MainDrawer() : null,
      floatingActionButton: floatingActionButton(context, ref),
      bottomNavigationBar: bottomNavigationBar(context, ref),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Builder(
          builder: (context) {
            switch (ScreenUtils.size(context)) {
              case ScreenSize.lg:
                return bodyLg(context, ref);
              case ScreenSize.md:
                return bodyMd(context, ref);
              case ScreenSize.sm:
                return body(context, ref);
            }
          },
        ),
      ),
    );
  }

  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return null;
  }

  AppBar? appBarMd(BuildContext context, WidgetRef ref) {
    return appBar(context, ref);
  }

  AppBar? appBarLg(BuildContext context, WidgetRef ref) {
    return appBarMd(context, ref);
  }

  FloatingActionButton? floatingActionButton(BuildContext context, WidgetRef ref) {
    return null;
  }

  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return null;
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
