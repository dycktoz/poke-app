import 'package:poke_app/domain/datasources/local/local_storage_datasource.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isPokeFavorite(String name) {
    return datasource.isPokeFavorite(name);
  }

  @override
  Future<List<Pokemon>> loadFavorites() {
    return datasource.loadFavorites();
  }

  @override
  Future<void> toggleFavorite(Pokemon pokemon) {
    return datasource.toggleFavorite(pokemon);
  }
}
