import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/infrastructure/models/pokemon_info_response_model.dart';

class PokemonMapper {
  static Pokemon pokemonToEntity(String name, int id) {
    return Pokemon(
      id: id,
      name: name,
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      types: [],
      abilities: [],
      stats: {},
      moves: [],
      isFavorite: false,
      evolutions: [],
    );
  }

  static Pokemon pokemonInfoToEntity(
    PokemonInfoResponseModel info, {
    String? description,
    bool isFavorite = false,
    List<EvolutionStep> evolutions = const [],
  }) {
    // Map types
    final List<String> types = info.types
        .map((t) => t.type.name ?? '')
        .where((t) => t.isNotEmpty)
        .toList();

    // Map abilities
    final List<String> abilities = info.abilities
        .map((a) => a.ability.name ?? '')
        .where((a) => a.isNotEmpty)
        .toList();

    // Map stats safely without using null-assert operator !
    final Map<String, int> stats = {};
    for (final s in info.stats) {
      final name = s.stat?.name;
      final base = s.baseStat;
      if (name != null && base != null) {
        stats[name] = base;
      }
    }

    // Map moves (take first 15 moves to not bloat details screen)
    final List<String> moves = info.moves
        .map((m) => m.move.name ?? '')
        .where((m) => m.isNotEmpty)
        .take(15)
        .toList();

    return Pokemon(
      id: info.id,
      name: info.name,
      imageUrl: info.sprites.other?.officialArtwork.frontDefault ?? 
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${info.id}.png',
      gifUrl: info.sprites.other?.showdown?.frontDefault,
      height: info.height,
      weight: info.weight,
      types: types,
      abilities: abilities,
      stats: stats,
      moves: moves,
      description: description,
      isFavorite: isFavorite,
      evolutions: evolutions,
    );
  }

  static Map<String, dynamic> toJson(Pokemon pokemon) {
    return {
      'id': pokemon.id,
      'name': pokemon.name,
      'imageUrl': pokemon.imageUrl,
      'gifUrl': pokemon.gifUrl,
      'height': pokemon.height,
      'weight': pokemon.weight,
      'types': pokemon.types,
      'abilities': pokemon.abilities,
      'stats': pokemon.stats,
      'moves': pokemon.moves,
      'description': pokemon.description,
      'isFavorite': pokemon.isFavorite,
      'evolutions': pokemon.evolutions.map((e) => e.toJson()).toList(),
    };
  }

  static Pokemon fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      gifUrl: json['gifUrl'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      types: List<String>.from(json['types'] as List? ?? []),
      abilities: List<String>.from(json['abilities'] as List? ?? []),
      stats: Map<String, int>.from(json['stats'] as Map? ?? {}),
      moves: List<String>.from(json['moves'] as List? ?? []),
      description: json['description'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
      evolutions: (json['evolutions'] as List? ?? [])
          .map((x) => EvolutionStep.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }
}
