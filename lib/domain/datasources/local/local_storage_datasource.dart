import 'package:poke_app/domain/entities/pokemon.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(Pokemon pokemon);
  Future<bool> isPokeFavorite(String name);
  Future<List<Pokemon>> loadFavorites();
}
