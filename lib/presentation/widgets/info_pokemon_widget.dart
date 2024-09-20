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
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: _DataContent(
                    value: height.toString(),
                    meterage: 'M',
                    title: 'Height',
                  ),
                ),
                Flexible(
                  child: CircleAvatar(
                    child: Image.network(pokemon.gifDefault ?? ''),
                  ),
                ),
                Flexible(
                  child: _DataContent(
                    value: weight.toString(),
                    meterage: 'Kg',
                    title: 'Weight',
                  ),
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
            height: size.height * 0.3,
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GradientCardWidget(
                      child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BarStats(
                          title: 'hp',
                          value: pokemon.hpStat,
                        ),
                        BarStats(
                          title: 'Attack',
                          value: pokemon.attackStat,
                        ),
                        BarStats(
                          title: 'Defense',
                          value: pokemon.defenseStat,
                        ),
                        BarStats(
                          title: 'Sp atk',
                          value: pokemon.specialAttackStat,
                        ),
                        BarStats(
                          title: 'Sp def',
                          value: pokemon.specialDefenseStat,
                        ),
                        BarStats(
                          title: 'Speed',
                          value: pokemon.speedStat,
                        )
                      ],
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GradientCardWidget(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8.0, // Espacio horizontal entre chips
                          runSpacing: 8.0, // Espacio vertical entre chips
                          children: [
                            Chip(
                              label: Text(
                                pokemon.move1 ?? '',
                              ),
                            ),
                            Chip(label: Text(pokemon.move2 ?? '')),
                            Chip(label: Text(pokemon.move3 ?? '')),
                            Chip(label: Text(pokemon.move4 ?? '')),
                            Chip(label: Text(pokemon.move5 ?? '')),
                            Chip(label: Text(pokemon.move6 ?? '')),
                            Chip(label: Text(pokemon.move7 ?? '')),
                            Chip(label: Text(pokemon.move8 ?? '')),
                            Chip(label: Text(pokemon.move9 ?? '')),
                            Chip(label: Text(pokemon.move10 ?? '')),
                          ]),
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(title ?? ''), Text(value.toString())],
              )),
          const SizedBox(
            width: 20,
          ),
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
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              double.parse(value).toStringAsFixed(3),
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              meterage,
              style: theme.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          title,
          style: theme.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
