import 'package:poke_app/domain/entities/pokemon.dart';

class PokemonMapper {
  static Pokemon pokemonToEntity(String name) => Pokemon(name: name);
}
