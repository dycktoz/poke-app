import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/domain/repositories/local_storage_repository.dart';
import 'local_storage_provider.dart';

final favoritePokemonsProvider =
    StateNotifierProvider<StoragePokemonsNotifier, Map<String, Pokemon>>(
  (ref) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return StoragePokemonsNotifier(
        localStorageRepository: localStorageRepository);
  },
);

class StoragePokemonsNotifier extends StateNotifier<Map<String, Pokemon>> {
  StoragePokemonsNotifier({required this.localStorageRepository}) : super({});

  final LocalStorageRepository localStorageRepository;

  Future<List<Pokemon>> loadFavorites() async {
    final pokemons = await localStorageRepository.loadFavorites();
    final tempPokemonsMap = <String, Pokemon>{};
    for (final poke in pokemons) {
      tempPokemonsMap[poke.name.toLowerCase()] = poke;
    }
    state = tempPokemonsMap;
    return pokemons;
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    await localStorageRepository.toggleFavorite(pokemon);
    final key = pokemon.name.toLowerCase();
    
    // Create a new map to properly trigger Riverpod updates
    final temp = Map<String, Pokemon>.from(state);
    if (temp.containsKey(key)) {
      temp.remove(key);
      state = temp;
    } else {
      state = {...state, key: pokemon.copyWith(isFavorite: true)};
    }
  }
}
