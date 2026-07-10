import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/providers/providers.dart';

class InfoScreen extends ConsumerStatefulWidget {
  const InfoScreen({
    super.key,
    required this.pokeId,
  });

  final String pokeId;

  static const name = 'info-screen';

  @override
  ConsumerState<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends ConsumerState<InfoScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(pokeInfoProvider.notifier).loadPokemon(widget.pokeId);
  }

  @override
  void didUpdateWidget(covariant InfoScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pokeId != widget.pokeId) {
      ref.read(pokeInfoProvider.notifier).loadPokemon(widget.pokeId);
    }
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return const Color(0xFF74CB48);
      case 'fire':
        return const Color(0xFFF57D31);
      case 'water':
        return const Color(0xFF6493EB);
      case 'bug':
        return const Color(0xFFA7B723);
      case 'normal':
        return const Color(0xFFAAA67F);
      case 'poison':
        return const Color(0xFFA43E9E);
      case 'electric':
        return const Color(0xFFF9CF30);
      case 'ground':
        return const Color(0xFFDEC16B);
      case 'fairy':
        return const Color(0xFFE69EAC);
      case 'fighting':
        return const Color(0xFFC12239);
      case 'psychic':
        return const Color(0xFFFB5584);
      case 'rock':
        return const Color(0xFFB69E31);
      case 'ghost':
        return const Color(0xFF70559B);
      case 'ice':
        return const Color(0xFF9AD6DF);
      case 'dragon':
        return const Color(0xFF7037FF);
      case 'dark':
        return const Color(0xFF75574C);
      case 'steel':
        return const Color(0xFFB7B9D0);
      case 'flying':
        return const Color(0xFFA891EC);
      default:
        return const Color(0xFFDC0A2D);
    }
  }

  String _formatNumber(int id) {
    return '#${id.toString().padLeft(3, '0')}';
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  void _onFavoritePressed(BuildContext context, WidgetRef ref, Pokemon pokemon) {
    final authState = ref.read(authProvider);
    if (authState.status != AuthStatus.authenticated) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Entrenador Requerido'),
          content: const Text('Necesitas iniciar sesión para poder agregar Pokémon a tus favoritos.'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.push('/login');
              },
              child: const Text('Iniciar Sesión', style: TextStyle(color: Color(0xFFDC0A2D), fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
      return;
    }

    ref.read(favoritePokemonsProvider.notifier).toggleFavorite(pokemon);
    ref.invalidate(isFavoriteProvider(pokemon.name));
  }

  @override
  Widget build(BuildContext context) {
    final Pokemon? pokemon = ref.watch(pokeInfoProvider)[widget.pokeId];

    if (pokemon == null) {
      return const Scaffold(
        backgroundColor: Color(0xFFDC0A2D),
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    final primaryTypeColor = pokemon.types.isNotEmpty 
        ? _getTypeColor(pokemon.types.first) 
        : const Color(0xFFDC0A2D);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: primaryTypeColor,
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
            // Background Watermark Pokeball Outline
            Positioned(
              right: -50,
              top: 10,
              child: Opacity(
                opacity: 0.12,
                child: CustomPaint(
                  size: const Size(220, 220),
                  painter: PokeballWatermarkPainter(color: Colors.white),
                ),
              ),
            ),

            // Top Header: Navigation & Name & Number
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _capitalize(pokemon.name),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _formatNumber(pokemon.id),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Arrows: Left / Right
            Positioned(
              left: 4,
              top: 160,
              child: pokemon.id > 1
                  ? IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.white70, size: 36),
                      onPressed: () {
                        context.replace('/pokemon/${pokemon.id - 1}');
                      },
                    )
                  : const SizedBox(width: 48),
            ),
            Positioned(
              right: 4,
              top: 160,
              child: pokemon.id < 1025
                  ? IconButton(
                      icon: const Icon(Icons.chevron_right, color: Colors.white70, size: 36),
                      onPressed: () {
                        context.replace('/pokemon/${pokemon.id + 1}');
                      },
                    )
                  : const SizedBox(width: 48),
            ),

            // Pokemon Main Image
            Positioned(
              left: 0,
              right: 0,
              top: 80,
              child: SizedBox(
                height: 200,
                child: Center(
                  child: Hero(
                    tag: 'pokemon-image-${pokemon.id}',
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      fit: BoxFit.contain,
                      width: 190,
                      height: 190,
                      placeholder: (context, url) => const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                        color: Colors.white54,
                        size: 80,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Content White Sheet Card
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              top: 260,
              child: Card(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Dynamic Favorite Button on the card
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Consumer(
                              builder: (context, ref, _) {
                                final isFavFuture = ref.watch(isFavoriteProvider(pokemon.name));
                                return IconButton(
                                  onPressed: () => _onFavoritePressed(context, ref, pokemon),
                                  icon: isFavFuture.when(
                                    data: (isFav) => Icon(
                                      isFav ? Icons.favorite_rounded : Icons.favorite_border,
                                      color: isFav ? Colors.red : Colors.grey,
                                      size: 28,
                                    ),
                                    loading: () => const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey),
                                    ),
                                    error: (_, __) => const Icon(Icons.error_outline),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        // 1. Type Badges
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pokemon.types.map((type) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getTypeColor(type),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _capitalize(type),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),

                        // 2. About section title
                        Text(
                          'About',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryTypeColor,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // About Grid details: Weight, Height, Moves
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Weight Column
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.scale, size: 18, color: isDark ? Colors.white70 : Colors.black54),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${((pokemon.weight ?? 0) * 0.1).toStringAsFixed(1)} kg',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: isDark ? Colors.white : Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: isDark ? Colors.white54 : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Vertical separator
                            Container(
                              height: 36,
                              width: 1,
                              color: isDark ? Colors.white12 : Colors.grey.shade300,
                            ),

                            // Height Column
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.straighten, size: 18, color: isDark ? Colors.white70 : Colors.black54),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${((pokemon.height ?? 0) * 0.1).toStringAsFixed(1)} m',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: isDark ? Colors.white : Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Height',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: isDark ? Colors.white54 : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Vertical separator
                            Container(
                              height: 36,
                              width: 1,
                              color: isDark ? Colors.white12 : Colors.grey.shade300,
                            ),

                            // Moves Column
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    pokemon.moves.isNotEmpty 
                                        ? _capitalize(pokemon.moves.first) 
                                        : 'None',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: isDark ? Colors.white : Colors.black87,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                  if (pokemon.moves.length > 1) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      _capitalize(pokemon.moves[1]),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: isDark ? Colors.white : Colors.black87,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                  const SizedBox(height: 4),
                                  Text(
                                    'Moves',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: isDark ? Colors.white54 : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // 3. Description Paragraph
                        if (pokemon.description != null && pokemon.description!.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              pokemon.description!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],

                        // 4. Base Stats
                        Text(
                          'Base Stats',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryTypeColor,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Base Stats Bars
                        _StatRow(label: 'HP', value: pokemon.stats['hp'] ?? 0, typeColor: primaryTypeColor),
                        _StatRow(label: 'ATK', value: pokemon.stats['attack'] ?? 0, typeColor: primaryTypeColor),
                        _StatRow(label: 'DEF', value: pokemon.stats['defense'] ?? 0, typeColor: primaryTypeColor),
                        _StatRow(label: 'SATK', value: pokemon.stats['special-attack'] ?? 0, typeColor: primaryTypeColor),
                        _StatRow(label: 'SDEF', value: pokemon.stats['special-defense'] ?? 0, typeColor: primaryTypeColor),
                        _StatRow(label: 'SPD', value: pokemon.stats['speed'] ?? 0, typeColor: primaryTypeColor),

                        // 5. Evolution Chain
                        if (pokemon.evolutions.isNotEmpty) ...[
                          const Divider(height: 32),
                          Text(
                            'Evoluciones',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryTypeColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: pokemon.evolutions.asMap().entries.map((entry) {
                                final index = entry.key;
                                final step = entry.value;
                                
                                return Row(
                                  children: [
                                    if (index > 0)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6),
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: isDark ? Colors.white30 : Colors.grey.shade400,
                                          size: 20,
                                        ),
                                      ),
                                    GestureDetector(
                                      onTap: () {
                                        if (step.id != pokemon.id) {
                                          context.replace('/pokemon/${step.id}');
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 68,
                                            height: 68,
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: isDark 
                                                  ? const Color(0xFF2C2C2C) 
                                                  : const Color(0xFFF7F7F7),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: step.id == pokemon.id
                                                    ? primaryTypeColor
                                                    : Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: step.imageUrl,
                                              fit: BoxFit.contain,
                                              placeholder: (context, url) => const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFDC0A2D)),
                                              ),
                                              errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            _capitalize(step.name),
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: step.id == pokemon.id
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: step.id == pokemon.id
                                                  ? primaryTypeColor
                                                  : isDark ? Colors.white70 : Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
       ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final int value;
  final Color typeColor;

  const _StatRow({
    required this.label,
    required this.value,
    required this.typeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // Stat name (HP, ATK, etc)
          SizedBox(
            width: 45,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: typeColor,
              ),
            ),
          ),
          
          // Vertical divider
          Container(
            height: 16,
            width: 1,
            color: isDark ? Colors.white12 : Colors.grey.shade300,
          ),
          const SizedBox(width: 12),

          // Stat Value
          SizedBox(
            width: 32,
            child: Text(
              value.toString().padLeft(3, '0'),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
          
          // Stat progress bar
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // Use TweenAnimationBuilder to animate the statistics fills on load!
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: value / 200.0),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, animValue, child) {
                  return LinearProgressIndicator(
                    value: animValue,
                    backgroundColor: isDark ? const Color(0xFF2C2C2C) : Colors.grey.shade200,
                    color: typeColor,
                    minHeight: 8,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PokeballWatermarkPainter extends CustomPainter {
  final Color color;

  PokeballWatermarkPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = size.width * 0.45;

    // Draw outer circle
    canvas.drawCircle(center, radius, paint);

    // Draw horizontal line in the middle
    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx + radius, center.dy),
      paint,
    );

    // Draw inner circle fill (smaller)
    final innerPaint = Paint()
      ..color = color.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.25, innerPaint);

    // Draw white center button outline
    canvas.drawCircle(center, radius * 0.25, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
