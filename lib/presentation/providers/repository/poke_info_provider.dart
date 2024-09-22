import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/providers/repository/poke_repository_provider.dart';

final pokeInfoProvider =
    StateNotifierProvider<PokeMapNotifier, Map<String, Pokemon>>(
  (ref) {
    final pokeRepository = ref.watch(pokeRepositoryProvider);
    return PokeMapNotifier(getPoke: pokeRepository.getPokemonInfo);
  },
);

typedef GetPokeCallback = Future<Pokemon> Function({required String id});

class PokeMapNotifier extends StateNotifier<Map<String, Pokemon>> {
  PokeMapNotifier({
    required this.getPoke,
  }) : super({});

  final GetPokeCallback getPoke;

  Future<void> loadPokemon(String pokeId) async {
    if (state[pokeId] != null) return;

    final pokemon = await getPoke(id: pokeId);
    state = {...state, pokeId: pokemon};
  }
}
