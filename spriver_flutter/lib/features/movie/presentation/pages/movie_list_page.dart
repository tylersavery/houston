import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_edit_page.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_form_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/widgets/movie_list_widget.dart';
import 'package:spriver_flutter/features/profile/presentation/widgets/profile_popup_menu_button.dart';

class MovieListPage extends ConsumerWidget {
  static String route() => "/movies";

  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Movies"),
        actions: const [
          ProfilePopupMenuButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          ref.read(movieFormProvider.notifier).reset();
          context.push(MovieEditPage.routeNew());
        },
      ),
      body: const MovieListWidget(),
    );
  }
}
