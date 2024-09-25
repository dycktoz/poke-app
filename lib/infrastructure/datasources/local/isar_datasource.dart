import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poke_app/domain/datasources/local/local_storage_datasource.dart';
import 'package:poke_app/domain/entities/pokemon.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;
  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([PokemonSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isPokeFavorite(Pokemon pokemon) async {
    final isar = await db;

    final Pokemon? isFavoritePoke =
        await isar.pokemons.filter().nameEqualTo(pokemon.name).findFirst();

    return isFavoritePoke != null;
  }

  @override
  Future<void> toggleFavorite(Pokemon pokemon) async {
    final isar = await db;
    final favoritePoke =
        await isar.pokemons.filter().nameEqualTo(pokemon.name).findFirst();

    if (favoritePoke != null) {
      isar.writeTxnSync(
        () =>
            isar.pokemons.filter().nameEqualTo(pokemon.name).deleteFirstSync(),
      );
    } else {
      isar.writeTxnSync(
        () => isar.pokemons.putSync(pokemon),
      );
    }
  }

  @override
  Future<List<Pokemon>> loadPokemons({int limit = 10, int offset = 0}) async {
    final isar = await db;
    return isar.pokemons.where().offset(offset).limit(limit).findAll();
  }
}
