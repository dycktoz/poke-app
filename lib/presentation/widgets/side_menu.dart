import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poke_app/presentation/providers/providers.dart';

class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    final authState = ref.watch(authProvider);
    final theme = Theme.of(context);
    final isDark = appThemeState.isDarkModeEnabled;
    final isLoggedIn = authState.status == AuthStatus.authenticated;
    final user = authState.user;

    // Set selected index based on active route
    final currentRoute = GoRouterState.of(context).matchedLocation;
    if (currentRoute == '/') {
      navDrawerIndex = 0;
    } else if (currentRoute == '/favorites') {
      navDrawerIndex = 1;
    } else if (currentRoute == '/login' || currentRoute == '/profile') {
      navDrawerIndex = 2;
    }

    final avatarUrl = isLoggedIn && user != null
        ? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${user.avatarPokemonId}.png'
        : 'https://i.pinimg.com/originals/46/e7/7e/46e77e3db6a6cdce8c63a9de331f31ff.png';

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index) {
        setState(() {
          navDrawerIndex = index;
        });
        
        widget.scaffoldKey.currentState?.closeDrawer();

        if (index == 0) {
          context.go('/');
        } else if (index == 1) {
          context.push('/favorites');
        } else if (index == 2) {
          if (isLoggedIn) {
            context.push('/profile');
          } else {
            context.push('/login');
          }
        }
      },
      children: [
        // Drawer Header
        GestureDetector(
          onTap: () {
            widget.scaffoldKey.currentState?.closeDrawer();
            if (isLoggedIn) {
              context.push('/profile');
            } else {
              context.push('/login');
            }
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            color: const Color(0xFFDC0A2D),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: avatarUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFDC0A2D)),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.person, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  isLoggedIn && user != null ? _capitalize(user.username) : 'Entrenador Invitado',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  isLoggedIn ? 'Rango: Entrenador Oficial' : 'Inicia sesión para guardar favoritos',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Navigation Destinations
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home, color: Color(0xFFDC0A2D)),
          label: Text('Inicio'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite, color: Color(0xFFDC0A2D)),
          label: Text('Favoritos'),
        ),
        
        NavigationDrawerDestination(
          icon: Icon(isLoggedIn ? Icons.person_outline : Icons.login_outlined),
          selectedIcon: Icon(isLoggedIn ? Icons.person : Icons.login, color: const Color(0xFFDC0A2D)),
          label: Text(isLoggedIn ? 'Perfil Entrenador' : 'Iniciar Sesión'),
        ),
        
        const Divider(indent: 16, endIndent: 16),
        
        // Theme Switch Tile
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(isDark ? Icons.dark_mode : Icons.light_mode, color: Colors.grey.shade600),
                  const SizedBox(width: 12),
                  Text(
                    'Modo Oscuro',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Switch(
                value: isDark,
                activeColor: const Color(0xFFDC0A2D),
                onChanged: (value) {
                  if (value) {
                    appThemeState.setDarkTheme();
                  } else {
                    appThemeState.setLightTheme();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
