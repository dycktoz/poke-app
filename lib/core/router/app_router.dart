import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/presentation/screens/pokemons_favorites_screen.dart';

import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/info_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: InfoScreen.name,
          builder: (context, state) {
            final pokeId = state.pathParameters['id'] ?? 'no-id';
            return InfoScreen(pokeId: pokeId);
          },
        ),
      ]),
  GoRoute(
    path: '/favorites',
    builder: (context, state) {
      return const PokemonsFavoritesScreen();
    },
  ),
], refreshListenable: GoRouterRefresh(refreshStream.stream));

final refreshStream = StreamController<void>();

// Llamar a esta función cuando quieras refrescar la pantalla anterior
void refreshScreen() {
  refreshStream.add(null);
}

class GoRouterRefresh extends ChangeNotifier {
  GoRouterRefresh(Stream<void> stream) {
    stream.listen((_) => notifyListeners());
  }
}
