import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/movie/presentation/widgets/movie_infinite_list_widget.dart';
import '../../../../core/widgets/base_screen.dart';
import 'movie_edit_screen.dart';
import '../providers/movie_form_provider.dart';

class MovieListScreen extends BaseScreen {
  static String route() => "/movie";

  const MovieListScreen({super.key, super.includeMainDrawer = true});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My Movies"),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(movieFormProvider.notifier).reset();
            context.push(MovieEditScreen.routeNew());
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const MovieInfiniteListWidget();
  }
}
