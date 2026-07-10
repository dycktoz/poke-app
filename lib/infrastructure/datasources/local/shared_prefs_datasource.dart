import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:poke_app/domain/datasources/local/local_storage_datasource.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/infrastructure/mappers/pokemon_mapper.dart';

class SharedPrefsDatasource extends LocalStorageDatasource {
  static const String _favoritesKey = 'favorite_pokemons';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<bool> isPokeFavorite(String name) async {
    final prefs = await _prefs;
    final List<String> list = prefs.getStringList(_favoritesKey) ?? [];
    return list.any((item) {
      final Map<String, dynamic> json = jsonDecode(item) as Map<String, dynamic>;
      return (json['name'] as String).toLowerCase() == name.toLowerCase();
    });
  }

  @override
  Future<void> toggleFavorite(Pokemon pokemon) async {
    final prefs = await _prefs;
    final List<String> list = prefs.getStringList(_favoritesKey) ?? [];
    
    int index = -1;
    for (int i = 0; i < list.length; i++) {
      final Map<String, dynamic> json = jsonDecode(list[i]) as Map<String, dynamic>;
      if ((json['name'] as String).toLowerCase() == pokemon.name.toLowerCase()) {
        index = i;
        break;
      }
    }

    if (index >= 0) {
      // Remove it
      list.removeAt(index);
    } else {
      // Add it
      final Pokemon favorited = pokemon.copyWith(isFavorite: true);
      list.add(jsonEncode(PokemonMapper.toJson(favorited)));
    }

    await prefs.setStringList(_favoritesKey, list);
  }

  @override
  Future<List<Pokemon>> loadFavorites() async {
    final prefs = await _prefs;
    final List<String> list = prefs.getStringList(_favoritesKey) ?? [];
    return list.map((item) {
      final Map<String, dynamic> json = jsonDecode(item) as Map<String, dynamic>;
      return PokemonMapper.fromJson(json);
    }).toList();
  }
}
