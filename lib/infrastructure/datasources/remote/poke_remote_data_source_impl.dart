import 'package:dio/dio.dart';
import 'package:poke_app/domain/datasources/remote/poke_remote_data_source.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/infrastructure/mappers/pokemon_mapper.dart';
import 'package:poke_app/infrastructure/models/poke_list_response_model.dart';
import 'package:poke_app/infrastructure/models/pokemon_info_response_model.dart';
import 'package:poke_app/infrastructure/models/pokemon_species_response_model.dart';

class PokeRemoteDataSourceImpl extends PokeRemoteDataSource {
  final Dio dio;

  PokeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      // Fetch up to 1300 pokemons to cover almost all generations
      final response = await dio.get('/pokemon', queryParameters: {
        'limit': 1300,
        'offset': 0,
      });

      if (response.statusCode == 200) {
        final pokeListResponse = PokeListResponseModel.fromJson(response.data);
        final List<Pokemon> pokeList = [];
        
        for (final item in pokeListResponse.results) {
          // Extract ID from url: https://pokeapi.co/api/v2/pokemon/1/
          final uri = Uri.parse(item.url);
          final segments = uri.pathSegments;
          // The last non-empty segment should be the ID
          final idString = segments.lastWhere((s) => s.isNotEmpty);
          final id = int.tryParse(idString);
          if (id != null) {
            pokeList.add(PokemonMapper.pokemonToEntity(item.name, id));
          }
        }
        return pokeList;
      } else {
        throw Exception('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('DioException: ${e.response?.statusCode} - ${e.response?.statusMessage}');
    } catch (e) {
      throw Exception('Unhandled error: $e');
    }
  }

  List<EvolutionStep> _parseEvolutionChain(Map<String, dynamic> data) {
    final List<EvolutionStep> steps = [];
    final chain = data['chain'] as Map<String, dynamic>?;
    if (chain == null) return [];

    void traverse(Map<String, dynamic> node) {
      final species = node['species'] as Map<String, dynamic>?;
      if (species != null) {
        final name = species['name'] as String? ?? '';
        final url = species['url'] as String? ?? '';
        
        if (url.isNotEmpty) {
          final uri = Uri.parse(url);
          final segments = uri.pathSegments;
          final idString = segments.lastWhere((s) => s.isNotEmpty, orElse: () => '');
          final id = int.tryParse(idString);
          if (id != null) {
            steps.add(EvolutionStep(
              name: name,
              id: id,
              imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
            ));
          }
        }
      }

      final evolvesTo = node['evolves_to'] as List?;
      if (evolvesTo != null && evolvesTo.isNotEmpty) {
        for (final next in evolvesTo) {
          if (next is Map<String, dynamic>) {
            traverse(next);
          }
        }
      }
    }

    traverse(chain);
    return steps;
  }

  @override
  Future<Pokemon> getPokemonInfo({required String id}) async {
    try {
      final response = await dio.get('/pokemon/$id');
      if (response.statusCode != 200) {
        throw Exception('Pokemon with ID/Name $id not found');
      }
      
      final pokeInfo = PokemonInfoResponseModel.fromJson(response.data);
      
      // Fetch species description and evolution chain
      String? description;
      List<EvolutionStep> evolutions = [];
      try {
        final speciesResponse = await dio.get('/pokemon-species/${pokeInfo.id}');
        if (speciesResponse.statusCode == 200) {
          final speciesData = speciesResponse.data as Map<String, dynamic>;
          final speciesModel = PokemonSpeciesResponseModel.fromJson(speciesData);
          final entries = speciesModel.flavorTextEntries;
          
          final esEntry = entries.where((e) => e.language.name == 'es').firstOrNull;
          final enEntry = entries.where((e) => e.language.name == 'en').firstOrNull;
          final selectedEntry = esEntry ?? enEntry ?? entries.firstOrNull;
          
          description = selectedEntry?.flavorText
              .replaceAll('\n', ' ')
              .replaceAll('\f', ' ')
              .replaceAll('\r', ' ');

          // Fetch evolution chain
          final evolutionChainInfo = speciesData['evolution_chain'] as Map<String, dynamic>?;
          if (evolutionChainInfo != null && evolutionChainInfo['url'] != null) {
            final evolutionUrl = evolutionChainInfo['url'] as String;
            final evoResponse = await dio.get(evolutionUrl);
            if (evoResponse.statusCode == 200) {
              final evoData = evoResponse.data as Map<String, dynamic>;
              evolutions = _parseEvolutionChain(evoData);
            }
          }
        }
      } catch (e) {
        // Fail-silent for species description and evolution chain
        print('Error fetching species description or evolutions: $e');
      }

      final pokemon = PokemonMapper.pokemonInfoToEntity(
        pokeInfo, 
        description: description,
        evolutions: evolutions,
      );
      return pokemon;
    } on DioException catch (e) {
      throw Exception('DioException: ${e.response?.statusCode} - ${e.response?.statusMessage}');
    } catch (e) {
      throw Exception('Unhandled error: $e');
    }
  }
}
