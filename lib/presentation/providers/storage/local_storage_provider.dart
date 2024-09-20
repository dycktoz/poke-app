import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/infrastructure/datasources/local/isar_datasource.dart';
import 'package:poke_app/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider(
  (ref) {
    return LocalStorageRepositoryImpl(IsarDatasource());
  },
);
