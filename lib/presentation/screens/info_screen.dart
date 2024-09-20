import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/providers/poke_info_provider.dart';
import 'package:poke_app/presentation/providers/storage/favorite_pokemons_provider.dart';
import 'package:poke_app/presentation/widgets/gradient_card_widget.dart';
import 'package:poke_app/presentation/widgets/info_pokemon_widget.dart';

import '../providers/storage/is_favorite_provider.dart';

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
  @override
  void initState() {
    super.initState();
    ref.read(pokeInfoProvider.notifier).loadPokemon(widget.pokeId);
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(pokemon));
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.5,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () async {
            await ref
                .read(favoritePokemonsProvider.notifier)
                .toggleFavorite(pokemon);
            ref.invalidate(isFavoriteProvider(pokemon));
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
        pokemon.name,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.end,
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        background: Padding(
            padding: EdgeInsets.fromLTRB(
                8, size.height * 0.15, 8, size.height * 0.05),
            child: GradientCardWidget(
              child: Center(
                child: Image.network(
                  pokemon.frontDefault ?? '',
                  fit: BoxFit.contain,
                ),
              ),
            )),
      ),
    );
  }
}
