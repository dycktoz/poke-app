import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/infrastructure/models/pokemon_info_response_model.dart';

class PokemonMapper {
  static Pokemon pokemonToEntity(String name) => Pokemon(name: name);

  static Pokemon pokemonInfoToEntity(PokemonInfoResponseModel pokemonInfo) =>
      Pokemon(
        name: pokemonInfo.name,
        frontDefault: pokemonInfo.sprites.other?.home.frontDefault,
        height: pokemonInfo.height,
        weigh: pokemonInfo.weight,
        // stats: pokemonInfo.stats,
      );
}
