import '../entities/pokemon.dart';

abstract class PokeRepository {
  Future<List<Pokemon>> getPokeList({
    int page = 1,
    String search = '',
    bool sortByNumber = true,
  });
  Future<Pokemon> getPokemonInfo({required String id});
}
