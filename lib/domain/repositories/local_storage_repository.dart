import '../entities/pokemon.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Pokemon pokemon);
  Future<bool> isPokeFavorite(Pokemon pokemon);
  Future<List<Pokemon>> loadPokemons({int limit = 10, int offset = 0});
}
