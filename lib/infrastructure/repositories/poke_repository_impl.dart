import 'package:poke_app/domain/datasources/remote/poke_remote_data_source.dart';
import 'package:poke_app/domain/repositories/poke_repository.dart';

import '../../domain/entities/pokemon.dart';

class PokeRepositoryImpl extends PokeRepository {
  PokeRepositoryImpl(this.dataSource);

  final PokeRemoteDataSource dataSource;

  @override
  Future<List<Pokemon>> getPokeList({int page = 1}) async {
    return await dataSource.getPokemonList(page: page);
  }

  @override
  Future<Pokemon> getPokemonInfo({required String id}) async {
    return await dataSource.getPokemonInfo(id: id);
  }
}
