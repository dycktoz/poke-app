import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/core/theme/app_theme.dart';
import 'package:poke_app/presentation/providers/theme/theme_provider.dart';

import 'core/router/app_router.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return MaterialApp.router(
      title: 'Material App',
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      darkTheme: AppTheme().getDarkTheme(),
      themeMode:
          appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
