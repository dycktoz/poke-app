import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/infrastructure/models/pokemon_info_response_model.dart';

class PokemonMapper {
  static Pokemon pokemonToEntity(String name) =>
      Pokemon(name: name, isFav: false);

  static Pokemon pokemonInfoToEntity(PokemonInfoResponseModel pokemonInfo) =>
      Pokemon(
        name: pokemonInfo.name,
        frontDefault: pokemonInfo.sprites.other?.home.frontDefault ??
            'https://i.pinimg.com/originals/46/e7/7e/46e77e3db6a6cdce8c63a9de331f31ff.png',
        gifDefault: pokemonInfo.sprites.other?.showdown.frontDefault ??
            'https://i.pinimg.com/originals/46/e7/7e/46e77e3db6a6cdce8c63a9de331f31ff.png',
        height: pokemonInfo.height,
        weigh: pokemonInfo.weight,
        hpStat: pokemonInfo.stats[0].baseStat ?? 50,
        attackStat: pokemonInfo.stats[1].baseStat ?? 50,
        defenseStat: pokemonInfo.stats[2].baseStat ?? 50,
        specialAttackStat: pokemonInfo.stats[3].baseStat ?? 50,
        specialDefenseStat: pokemonInfo.stats[4].baseStat ?? 50,
        speedStat: pokemonInfo.stats[5].baseStat ?? 50,

        move1: (pokemonInfo.moves.length > 1)
            ? pokemonInfo.moves[0].move.name ?? 'mega-punch'
            : 'mega-punch',

        move2: (pokemonInfo.moves.length > 2)
            ? pokemonInfo.moves[1].move.name ?? 'ice-punch'
            : 'ice-punch',

        move3: (pokemonInfo.moves.length > 3)
            ? pokemonInfo.moves[2].move.name ?? 'headbutt'
            : 'headbutt',
        move4: (pokemonInfo.moves.length > 4)
            ? pokemonInfo.moves[3].move.name ?? 'tackle'
            : 'tackle',
        move5: (pokemonInfo.moves.length > 5)
            ? pokemonInfo.moves[4].move.name ?? 'counter'
            : 'counter',
        move6: (pokemonInfo.moves.length > 6)
            ? pokemonInfo.moves[5].move.name ?? 'toxic'
            : 'toxic',
        move7: (pokemonInfo.moves.length > 7)
            ? pokemonInfo.moves[6].move.name ?? 'rage'
            : 'rage',
        move8: (pokemonInfo.moves.length > 8)
            ? pokemonInfo.moves[7].move.name ?? 'snore'
            : 'snore',
        move9: (pokemonInfo.moves.length > 9)
            ? pokemonInfo.moves[8].move.name ?? 'substitute'
            : 'substitute',
        move10: (pokemonInfo.moves.length > 10)
            ? pokemonInfo.moves[9].move.name ?? 'special-defence'
            : 'special-defence',
        isFav: true,

        // stats: pokemonInfo.stats,
      );
}
