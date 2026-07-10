import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/presentation/providers/providers.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/info_screen.dart';
import '../../presentation/screens/pokemons_favorites_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/profile_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == '/login';
      final isLoggedIn = authState.status == AuthStatus.authenticated;

      // While checking authentication, do not redirect
      if (authState.status == AuthStatus.checking) return null;

      final isProtectedRoute = state.matchedLocation == '/favorites' || state.matchedLocation == '/profile';

      if (isProtectedRoute && !isLoggedIn) {
        return '/login';
      }

      if (isLoggingIn && isLoggedIn) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: ProfileScreen.name,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/pokemon/:id',
        name: InfoScreen.name,
        builder: (context, state) {
          final pokeId = state.pathParameters['id'] ?? '1';
          return InfoScreen(pokeId: pokeId);
        },
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const PokemonsFavoritesScreen(),
      ),
    ],
  );
});
