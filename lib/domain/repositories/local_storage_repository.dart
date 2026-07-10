import '../entities/pokemon.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Pokemon pokemon);
  Future<bool> isPokeFavorite(String name);
  Future<List<Pokemon>> loadFavorites();
}
