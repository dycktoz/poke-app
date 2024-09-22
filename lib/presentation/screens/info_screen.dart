import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/widgets/gradient_card_widget.dart';
import 'package:poke_app/presentation/widgets/info_pokemon_widget.dart';
import 'package:poke_app/presentation/providers/providers.dart';

class InfoScreen extends ConsumerStatefulWidget {
  const InfoScreen({
    super.key,
    required this.pokeId,
  });

  final String pokeId;

  static const name = 'info-screen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoScreenState();
}

class _InfoScreenState extends ConsumerState<InfoScreen> {
  final _scrollcontroller = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(pokeInfoProvider.notifier).loadPokemon(widget.pokeId);
  }

  @override
  void dispose() {
    _scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Pokemon? pokemon = ref.watch(pokeInfoProvider)[widget.pokeId];

    if (pokemon == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        body: CustomScrollView(
      physics: const ClampingScrollPhysics(),
      controller: _scrollcontroller,
      slivers: [
        _CustomSliverAppbar(pokemon: pokemon),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => InfoPokemonWidget(
            pokemon: pokemon,
          ),
          childCount: 1,
        ))
      ],
    ));
  }
}

class _CustomSliverAppbar extends ConsumerWidget {
  const _CustomSliverAppbar({required this.pokemon});

  final Pokemon pokemon;
  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(pokemon));
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SliverAppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      expandedHeight: size.height * 0.5,
      actions: [
        IconButton(
          onPressed: () async {
            await ref
                .read(favoritePokemonsProvider.notifier)
                .toggleFavorite(pokemon);

            ref.invalidate(isFavoriteProvider(pokemon));
            ref.invalidate(pokeListProvider);
            ref.read(pokeListProvider.notifier).loadNextPage();
          },
          icon: isFavoriteFuture.when(
            data: (isFav) => isFav
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
            error: (_, __) => throw UnimplementedError(),
            loading: () => const CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        )
      ],
      title: Text(
        capitalize(
          pokemon.name,
        ), // Capitaliza la primera letra
        style: theme.textTheme.headlineLarge!
            .copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.end,
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        background: Padding(
            padding: EdgeInsets.fromLTRB(
                8, size.height * 0.15, 8, size.height * 0.05),
            child: GradientCardWidget(
              child: Center(
                child: Image.network(pokemon.frontDefault ?? '',
                    fit: BoxFit.contain, errorBuilder: (BuildContext context,
                        Object error, StackTrace? stackTrace) {
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
            )),
      ),
    );
  }
}
