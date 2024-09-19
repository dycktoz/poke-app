import '../entities/pokemon.dart';

abstract class PokeRepository {
  Future<List<Pokemon>> getPokeList({int page = 1});
}
