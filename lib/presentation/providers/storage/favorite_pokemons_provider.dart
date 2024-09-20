import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/domain/repositories/local_storage_repository.dart';
import 'package:poke_app/presentation/providers/storage/local_storage_provider.dart';

final favoritePokemonsProvider =
    StateNotifierProvider<StoragePokemonsNotifier, Map<int, Pokemon>>(
  (ref) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return StoragePokemonsNotifier(
        localStorageRepository: localStorageRepository);
  },
);

class StoragePokemonsNotifier extends StateNotifier<Map<int, Pokemon>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StoragePokemonsNotifier({required this.localStorageRepository}) : super({});

  Future<List<Pokemon>> loadNextPage() async {
    final pokemons =
        await localStorageRepository.loadPokemons(offset: page * 10);
    page++;
    final tempPokemonsMap = <int, Pokemon>{};
    for (final poke in pokemons) {
      tempPokemonsMap[poke.isarId] = poke;
    }
    state = {...state, ...tempPokemonsMap};
    return pokemons;
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    await localStorageRepository.toggleFavorite(pokemon);
    final bool isPokeInFavorites = state[pokemon.isarId] != null;
    if (isPokeInFavorites) {
      state.remove(pokemon.isarId);
      state = {...state};
    } else {
      state = {...state, pokemon.isarId: pokemon};
    }
  }
}
