import 'package:poke_app/domain/datasources/remote/poke_remote_data_source.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/domain/repositories/poke_repository.dart';

class PokeRepositoryImpl extends PokeRepository {
  final PokeRemoteDataSource dataSource;
  List<Pokemon>? _cachedFullList;

  PokeRepositoryImpl(this.dataSource);

  @override
  Future<List<Pokemon>> getPokeList({
    int page = 1,
    String search = '',
    bool sortByNumber = true,
  }) async {
    // 1. Fetch full list if not cached
    _cachedFullList ??= await dataSource.getAllPokemons();

    List<Pokemon> filteredList = List.from(_cachedFullList!);

    // 2. Local Search filter
    if (search.trim().isNotEmpty) {
      final query = search.trim().toLowerCase();
      filteredList = filteredList.where((p) {
        final matchesName = p.name.toLowerCase().contains(query);
        final matchesId = p.id.toString() == query;
        return matchesName || matchesId;
      }).toList();
    }

    // 3. Local Sorting
    if (sortByNumber) {
      filteredList.sort((a, b) => a.id.compareTo(b.id));
    } else {
      filteredList.sort((a, b) => a.name.compareTo(b.name));
    }

    // 4. Pagination (Limit 20 per page)
    const int limit = 20;
    final int offset = (page - 1) * limit;

    if (offset >= filteredList.length) {
      return [];
    }

    final int end = (offset + limit).clamp(0, filteredList.length);
    return filteredList.sublist(offset, end);
  }

  @override
  Future<Pokemon> getPokemonInfo({required String id}) async {
    return await dataSource.getPokemonInfo(id: id);
  }
}
