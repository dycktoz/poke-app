import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/widgets/gradient_card_widget.dart';

class InfoPokemonWidget extends ConsumerWidget {
  const InfoPokemonWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weight = ((pokemon.weigh ?? 0) * 0.1);
    final height = ((pokemon.height ?? 0) * 0.1);
    return ColoredBox(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _DataContent(
                  value: height.toString(),
                  meterage: 'M',
                  title: 'Height',
                ),
                CircleAvatar(
                  child: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/2.gif'),
                ),
                _DataContent(
                  value: weight.toString(),
                  meterage: 'Kg',
                  title: 'Weight',
                ),
              ],
            ),
          ),
          _TabsPages(
            pokemon: pokemon,
          ),
        ],
      ),
    );
  }
}

class _TabsPages extends ConsumerWidget {
  const _TabsPages({required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final kTabs = <Tab>[
      const Tab(
        text: 'Stats',
      ),
      const Tab(
        text: 'Moves',
      )
    ];
    return DefaultTabController(
        length: kTabs.length,
        child: Column(children: [
          TabBar(tabs: kTabs),
          SizedBox(
            width: size.width,
            height: size.height * 0.4,
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GradientCardWidget(
                      child: SizedBox(
                          // child: Column(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: pokemon.stats != null
                          //       ? pokemon.stats!
                          //           .map(
                          //             (e) => BarStats(
                          //               title: e?.stat?.name,
                          //               value: e?.baseStat,
                          //             ),
                          //           )
                          //           .toList()
                          //       : [],
                          // ),
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GradientCardWidget(
                    child: Center(
                      child: Text('hola'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

class BarStats extends StatelessWidget {
  const BarStats({super.key, this.title, this.value = 0});

  final String? title;
  final int? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(flex: 2, child: Text(title ?? '')),
          Flexible(flex: 2, child: Text(value.toString())),
          Expanded(
            flex: 4,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              value: (value! * 0.01),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class _DataContent extends StatelessWidget {
  const _DataContent(
      {required this.value, required this.title, required this.meterage});

  final String value;
  final String title;
  final String meterage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(value),
            const SizedBox(
              width: 4,
            ),
            Text(meterage),
          ],
        ),
        Text(title),
      ],
    );
  }
}
