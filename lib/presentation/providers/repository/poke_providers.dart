import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/presentation/providers/repository/poke_repository_provider.dart';

import '../../../domain/entities/pokemon.dart';

final pokeListProvider =
    StateNotifierProvider<PokeListNotifier, List<Pokemon>>((ref) {
  final fetchMorePoke = ref.watch(pokeRepositoryProvider).getPokeList;

  return PokeListNotifier(fetchMorePoke: fetchMorePoke);
});

typedef PokeCallback = Future<List<Pokemon>> Function({int page});

class PokeListNotifier extends StateNotifier<List<Pokemon>> {
  PokeListNotifier({
    required this.fetchMorePoke,
  }) : super([]);
  int currentPage = 1;
  PokeCallback fetchMorePoke;
  Pokemon? pokemon;

  Future<List<Pokemon>> loadNextPage() async {
    final List<Pokemon> pokeList = await fetchMorePoke(page: currentPage);
    state = [...state, ...pokeList];
    currentPage++;
    return pokeList;
  }

  // List<Pokemon> updatePokemon(Pokemon updatedPokemon) {
  //   state = state.map((pokemon) {
  //     // Si el nombre coincide, reemplazarlo con el nuevo Pokémon
  //     if (pokemon.name == updatedPokemon.name) {
  //       return updatedPokemon;
  //     } else {
  //       return pokemon;
  //     }
  //   }).toList();

  //   // Retornar la lista actualizada
  //   return state;
  // }
}
