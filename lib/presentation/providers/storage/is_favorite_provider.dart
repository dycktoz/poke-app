import 'package:riverpod/riverpod.dart';

import '../../../domain/entities/pokemon.dart';
import 'local_storage_provider.dart';

final isFavoriteProvider = FutureProvider.family(
  (ref, Pokemon pokemon) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return localStorageRepository.isPokeFavorite(pokemon);
  },
);
