import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/infrastructure/datasources/remote/poke_remote_data_source_impl.dart';
import 'package:poke_app/infrastructure/repositories/poke_repository_impl.dart';

final pokeRepositoryProvider = Provider((ref) {
  return PokeRepositoryImpl(PokeRemoteDataSourceImpl());
});
