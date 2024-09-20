import 'package:poke_app/domain/entities/pokemon.dart';

abstract class PokeRemoteDataSource {
  Future<List<Pokemon>> getPokemonList({int page = 1});
  Future<Pokemon> getPokemonInfo({required String id});
}
