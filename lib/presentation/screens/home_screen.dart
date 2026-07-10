import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/providers/providers.dart';
import 'package:poke_app/presentation/widgets/side_menu.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final scrollController = ScrollController();
  final searchController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokeListProvider.notifier).loadNextPage();
    });

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 150) >= scrollController.position.maxScrollExtent) {
        ref.read(pokeListProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final sortByNumber = ref.watch(pokeListProvider).sortByNumber;
            return Dialog(
              backgroundColor: const Color(0xFFDC0A2D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sort by:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          RadioListTile<bool>(
                            value: true,
                            groupValue: sortByNumber,
                            activeColor: const Color(0xFFDC0A2D),
                            title: const Text('Number', style: TextStyle(color: Colors.black)),
                            onChanged: (val) {
                              if (val != null) {
                                ref.read(pokeListProvider.notifier).updateSorting(val);
                                Navigator.pop(context);
                              }
                            },
                          ),
                          RadioListTile<bool>(
                            value: false,
                            groupValue: sortByNumber,
                            activeColor: const Color(0xFFDC0A2D),
                            title: const Text('Name', style: TextStyle(color: Colors.black)),
                            onChanged: (val) {
                              if (val != null) {
                                ref.read(pokeListProvider.notifier).updateSorting(val);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokeState = ref.watch(pokeListProvider);
    final authState = ref.watch(authProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isLoggedIn = authState.status == AuthStatus.authenticated;
    final user = authState.user;

    final avatarUrl = isLoggedIn && user != null
        ? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${user.avatarPokemonId}.png'
        : 'https://i.pinimg.com/originals/46/e7/7e/46e77e3db6a6cdce8c63a9de331f31ff.png';

    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: Column(
        children: [
          // 1. Red Header Block
          Container(
            color: const Color(0xFFDC0A2D),
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                    ),
                    const Text(
                      'Pokédex',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    // Top-right Trainer avatar shortcut
                    GestureDetector(
                      onTap: () {
                        if (isLoggedIn) {
                          context.push('/profile');
                        } else {
                          context.push('/login');
                        }
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: CachedNetworkImage(
                            imageUrl: avatarUrl,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(strokeWidth: 1.5, color: Color(0xFFDC0A2D)),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.person, color: Colors.grey, size: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    // Search Bar
                    Expanded(
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: searchController,
                          style: const TextStyle(color: Colors.black87),
                          onChanged: (query) {
                            ref.read(pokeListProvider.notifier).updateSearch(query);
                          },
                          decoration: InputDecoration(
                            hintText: 'Buscar',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Sort Button
                    GestureDetector(
                      onTap: _showSortDialog,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            pokeState.sortByNumber ? '#' : 'AZ',
                            style: const TextStyle(
                              color: Color(0xFFDC0A2D),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // 2. Pokemon Grid Section
          Expanded(
            child: pokeState.pokemons.isEmpty && pokeState.isLoading
                ? const Center(child: CircularProgressIndicator(color: Color(0xFFDC0A2D)))
                : pokeState.pokemons.isEmpty
                    ? Center(
                        child: Text(
                          'No se encontraron Pokémon',
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      )
                    : GridView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.all(12),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: pokeState.pokemons.length + (pokeState.isLoading ? 3 : 0),
                        itemBuilder: (context, index) {
                          if (index >= pokeState.pokemons.length) {
                            return const LoadingPlaceholderCard();
                          }
                          
                          final pokemon = pokeState.pokemons[index];
                          return PokemonGridCard(pokemon: pokemon);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class PokemonGridCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonGridCard({super.key, required this.pokemon});

  @override
  State<PokemonGridCard> createState() => _PokemonGridCardState();
}

class _PokemonGridCardState extends State<PokemonGridCard> {
  double _scale = 1.0;

  String _formatNumber(int id) {
    return '#${id.toString().padLeft(3, '0')}';
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.92),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: () {
        context.push('/pokemon/${widget.pokemon.id}');
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF7F7F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isDark ? Colors.white12 : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              // Number Top Right
              Positioned(
                right: 8,
                top: 6,
                child: Text(
                  _formatNumber(widget.pokemon.id),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white54 : Colors.grey.shade600,
                  ),
                ),
              ),
              
              // Image & Name
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 16, 6, 6),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Hero(
                          tag: 'pokemon-image-${widget.pokemon.id}',
                          child: CachedNetworkImage(
                            imageUrl: widget.pokemon.imageUrl,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error_outline,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _capitalize(widget.pokemon.name),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingPlaceholderCard extends StatelessWidget {
  const LoadingPlaceholderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: isDark ? const Color(0xFF1E1E1E).withOpacity(0.5) : Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Color(0xFFDC0A2D),
          ),
        ),
      ),
    );
  }
}
