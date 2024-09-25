import 'package:poke_app/domain/datasources/local/local_storage_datasource.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  LocalStorageRepositoryImpl(this.datasource);
  final LocalStorageDatasource datasource;

  @override
  Future<bool> isPokeFavorite(Pokemon pokemon) {
    return datasource.isPokeFavorite(pokemon);
  }

  @override
  Future<List<Pokemon>> loadPokemons({int limit = 10, int offset = 0}) {
    return datasource.loadPokemons(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Pokemon pokemon) {
    return datasource.toggleFavorite(pokemon);
  }
}
