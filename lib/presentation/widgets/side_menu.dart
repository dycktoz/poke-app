import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final theme = Theme.of(context);
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
          context.push('/favorites');
        });
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        CircleAvatar(
          radius: 50,
          child: Image.network(
              'https://i.pinimg.com/originals/46/e7/7e/46e77e3db6a6cdce8c63a9de331f31ff.png',
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(
              child: Text(
                'Error al cargar la imagen',
                style: TextStyle(color: Colors.red),
              ),
            );
          }, loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child; // La imagen ya está cargada
            }
            return Center(
                child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ));
          }),
        ),
        ListTile(
          title: Text(
            'Cambiar tema',
            style: theme.textTheme.titleMedium,
          ),
          subtitle: Switch(
            value: appThemeState.isDarkModeEnabled,
            onChanged: (value) {
              if (value) {
                appThemeState.setDarkTheme();
              } else {
                appThemeState.setLightTheme();
              }
            },
          ),
        ),
        const Divider(),
        NavigationDrawerDestination(
          icon: const Icon(Icons.add),
          label: Text(
            'Favoritos',
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
