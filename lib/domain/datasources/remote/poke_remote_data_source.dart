import 'package:poke_app/domain/entities/pokemon.dart';

abstract class PokeRemoteDataSource {
  Future<List<Pokemon>> getAllPokemons();
  Future<Pokemon> getPokemonInfo({required String id});
}
