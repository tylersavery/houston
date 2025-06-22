import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../base_component.dart';
import 'main_drawer.dart';

class Dashboard extends BaseComponent {
  final StatefulNavigationShell navigationShell;
  const Dashboard({super.key, required this.navigationShell});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(child: navigationShell),
        NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          destinations: const [
            NavigationDestination(label: "Game", icon: Icon(Icons.star)),
            NavigationDestination(label: "GameSystem", icon: Icon(Icons.star)),
            NavigationDestination(label: "Movie", icon: Icon(Icons.star)),
            //::HOUSTON_INSERT_TAB::
          ],
        ),
      ],
    );
  }

  @override
  Widget bodyMd(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: Row(
        children: [
          Column(
            children: [
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  );
                },
              ),
              Expanded(
                child: NavigationRail(
                  selectedIndex: navigationShell.currentIndex,
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      label: Text("Game"),
                      icon: Icon(Icons.star),
                    ),
                    NavigationRailDestination(
                      label: Text("GameSystem"),
                      icon: Icon(Icons.star),
                    ),
                    NavigationRailDestination(
                      label: Text("Movie"),
                      icon: Icon(Icons.star),
                    ),
                    //::HOUSTON_INSERT_NAV::
                  ],
                  onDestinationSelected: (index) {
                    navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    );
                  },
                ),
              ),
            ],
          ),
          const VerticalDivider(),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}
