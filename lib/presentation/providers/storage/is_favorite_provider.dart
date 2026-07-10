import 'package:riverpod/riverpod.dart';
import 'local_storage_provider.dart';

final isFavoriteProvider = FutureProvider.family<bool, String>(
  (ref, String name) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return localStorageRepository.isPokeFavorite(name);
  },
);
