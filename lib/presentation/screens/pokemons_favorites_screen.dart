import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class PokemonsFavoritesScreen extends ConsumerStatefulWidget {
  const PokemonsFavoritesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonsFavoritesScreenState();
}

class _PokemonsFavoritesScreenState
    extends ConsumerState<PokemonsFavoritesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(favoritePokemonsProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoritePokemos = ref.watch(favoritePokemonsProvider).values.toList();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite List'),
      ),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView.builder(
            itemCount: favoritePokemos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favoritePokemos[index].name),
                leading:
                    Image.network(favoritePokemos[index].frontDefault ?? '',
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                  return const Center(
                    child: Text(
                      'Error al cargar la imagen',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }, loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // La imagen ya está cargada
                  }
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  );
                }),
              );
            },
          )),
    );
  }
}
