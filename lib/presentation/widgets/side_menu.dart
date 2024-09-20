import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme/theme_provider.dart';

class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        const NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: Text('xd'),
        ),
        Switch(
          value: appThemeState.isDarkModeEnabled,
          onChanged: (value) {
            if (value) {
              appThemeState.setDarkTheme();
            } else {
              appThemeState.setLightTheme();
            }
          },
        ),
      ],
    );
  }
}
