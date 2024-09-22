import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/widgets/gradient_card_widget.dart';
import 'package:poke_app/presentation/widgets/side_menu.dart';

import '../../core/router/app_router.dart';
import '../providers/providers.dart';

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
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
      body: SafeArea(
        child: isLastPage
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomScrollView(
                  controller: scrollcontroller,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: theme.scaffoldBackgroundColor,
                      expandedHeight: size.height * 0.05,
                      centerTitle: true,
                      actions: [
                        CircleAvatar(
                          child: Image.network(
                              'https://i.pinimg.com/originals/46/e7/7e/46e77e3db6a6cdce8c63a9de331f31ff.png'),
                        )
                      ],
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        child: Text(
                          'Encuentra tu Pokemon',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Buscar',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
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
                    ),
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final pokemon = pokeList[index];

                          return CardPoke(index, pokemon);
                        },
                        childCount: pokeList.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class CardPoke extends ConsumerStatefulWidget {
  const CardPoke(this.index, this.pokemon, {super.key});
  final int index;
  final Pokemon pokemon;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardPokeState();
}

class _CardPokeState extends ConsumerState<CardPoke> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {
  //     refreshScreen();
  //   });
  // }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(widget.pokemon));

    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        context.push('/movie/${widget.index + 1}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CustomGradient(
          colors: const [Colors.blue, Color.fromARGB(255, 69, 69, 61)],
          end: Alignment.bottomRight,
          begin: Alignment.topCenter,
          stops: const [
            0.6,
            1.0,
          ],
          child: Stack(
            children: [
              const CustomGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(50, 105, 104, 101),
                ],
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                stops: [
                  0.8,
                  1.0,
                ],
              ),
              Positioned(
                left: 8,
                top: 8,
                child: isFavoriteFuture.when(
                  data: (isFav) => isFav
                      ? const Icon(Icons.favorite_rounded, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                  error: (_, __) => throw UnimplementedError(),
                  loading: () =>
                      const CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.index + 1}.png',
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
                  return Center(
                      child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ));
                }),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Text(
                  _capitalize(widget.pokemon.name),
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Positioned(
                right: 8,
                bottom: 8,
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
