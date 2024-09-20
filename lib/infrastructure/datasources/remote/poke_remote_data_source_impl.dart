import 'package:dio/dio.dart';
import 'package:poke_app/domain/datasources/remote/poke_remote_data_source.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/infrastructure/mappers/pokemon_mapper.dart';
import 'package:poke_app/infrastructure/models/poke_list_response_model.dart';
import 'package:poke_app/infrastructure/models/pokemon_info_response_model.dart';

class PokeRemoteDataSourceImpl extends PokeRemoteDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2',
  ));

  @override
  Future<List<Pokemon>> getPokemonList({int page = 1}) async {
    const int limit = 20;
    final int offset = (page - 1) * limit;
    try {
      // Solicitud con parámetros de paginación
      final response = await dio.get('/pokemon', queryParameters: {
        'offset': offset,
        'limit': limit,
      });

      if (response.statusCode == 200) {
        // Si el código de estado es 200, procesamos la respuesta
        final pokeListResponse = PokeListResponseModel.fromJson(response.data);
        final List<Pokemon> pokeList = pokeListResponse.results
            .map((e) => PokemonMapper.pokemonToEntity(e.name))
            .toList();
        return pokeList;
      } else {
        // Si el código no es 200, arrojamos una excepción personalizada
        throw Exception(
            'Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Capturamos detalles de la excepción y los imprimimos para depuración
      print(
          'DioException: ${e.response?.statusCode} - ${e.response?.statusMessage}');
      throw Exception(
          'DioException: ${e.response?.statusCode} - ${e.response?.statusMessage}');
    } catch (e) {
      // Capturamos cualquier otro tipo de excepción
      throw Exception('Unhandled error: $e');
    }
  }

  @override
  Future<Pokemon> getPokemonInfo({required String id}) async {
    try {
      final response = await dio.get('/pokemon/$id');
      if (response.statusCode != 200) {
        throw Exception('Pokemon with $id not found');
      }
      final pokeInfo = PokemonInfoResponseModel.fromJson(response.data);
      final pokemon = PokemonMapper.pokemonInfoToEntity(pokeInfo);
      return pokemon;
    } on DioException catch (e) {
      // Capturamos detalles de la excepción y los imprimimos para depuración
      print(
          'DioException: ${e.response?.statusCode} - ${e.response?.statusMessage}');
      throw Exception(
          'DioException: ${e.response?.statusCode} - ${e.response?.statusMessage}');
    } catch (e) {
      throw Exception('Unhandled error: $e');
    }
  }
}
