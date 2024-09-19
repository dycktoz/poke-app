import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/presentation/providers/poke_providers.dart';
import 'package:poke_app/presentation/providers/theme/theme_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(pokeListProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final pokeList = ref.watch(pokeListProvider);
    final appThemeState = ref.watch(appThemeStateNotifier);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Switch(
        value: appThemeState.isDarkModeEnabled,
        onChanged: (value) {
          if (value) {
            appThemeState.setDarkTheme();
          } else {
            appThemeState.setLightTheme();
          }
        },
      ),
      body: ListView.builder(
        itemCount: pokeList.length,
        itemBuilder: (context, index) {
          final pokemon = pokeList[index];
          return ListTile(
            title: Text(pokemon.name),
          );
        },
      ),
    );
  }
}
