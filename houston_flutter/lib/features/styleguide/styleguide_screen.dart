import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/core/widgets/base_screen.dart';

class StyleguideScreen extends BaseScreen {
  static String route() => "/styleguide";

  const StyleguideScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(title: const Text("Styleguide"));
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
