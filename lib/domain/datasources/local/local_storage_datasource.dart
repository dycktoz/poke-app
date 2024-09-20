import 'package:poke_app/domain/entities/pokemon.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(Pokemon pokemon);
  Future<bool> isPokeFavorite(Pokemon pokemon);
  Future<List<Pokemon>> loadMovies({int limit = 10, int offset = 0});
}
