import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/presentation/providers/poke_providers.dart';
import 'package:poke_app/presentation/providers/storage/favorite_pokemons_provider.dart';
import 'package:poke_app/presentation/providers/storage/is_favorite_provider.dart';
import 'package:poke_app/presentation/providers/storage/local_storage_provider.dart';
import 'package:poke_app/presentation/providers/theme/theme_provider.dart';
import 'package:poke_app/presentation/widgets/side_menu.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isLoading = false;
  bool isLastPage = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollcontroller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    scrollcontroller.addListener(
      () {
        if ((scrollcontroller.position.pixels + 100) >=
            scrollcontroller.position.maxScrollExtent) {
          loadNextPage();
        }
      },
    );
    loadNextPage();
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  void loadNextPage() async {
    if (isLastPage || isLastPage) return;
    final pokes = await ref.read(pokeListProvider.notifier).loadNextPage();
    if (pokes.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokeList = ref.watch(pokeListProvider);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const CircleAvatar())],
      ),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(
              child: Text(
                'Encuentra tu Pokemon',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Escribe algo...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo no puede estar vacío';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                controller: scrollcontroller,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas (2 columnas)
                  crossAxisSpacing: 10.0, // Espacio horizontal entre elementos
                  mainAxisSpacing: 10.0, // Espacio vertical entre elementos
                  childAspectRatio:
                      1.0, // Relación de aspecto para ajustar las imágenes (ancho/alto)
                ),
                itemCount: pokeList.length,
                itemBuilder: (context, index) {
                  final pokemon = pokeList[index];
                  final isFavoriteFuture =
                      ref.watch(isFavoriteProvider(pokemon));
                  return InkWell(
                    onTap: () {
                      context.push('/movie/${index + 1}');
                    },
                    child: Card(
                      color: Colors.amber,
                      child: Stack(
                        children: [
                          Positioned(
                              right: 4,
                              child: IconButton(
                                onPressed: () async {
                                  await ref
                                      .read(favoritePokemonsProvider.notifier)
                                      .toggleFavorite(pokemon);
                                  ref.invalidate(isFavoriteProvider(pokemon));
                                },
                                icon: isFavoriteFuture.when(
                                  data: (isFav) => isFav
                                      ? const Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.red,
                                        )
                                      : const Icon(Icons.favorite_border),
                                  error: (_, __) => throw UnimplementedError(),
                                  loading: () =>
                                      const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.network(
                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png',
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Text(
                              pokemon.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            bottom: 4,
                            child: IconButton(
                                iconSize: 32,
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_circle_right_outlined,
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
