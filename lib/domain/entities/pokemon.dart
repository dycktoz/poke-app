import 'package:isar/isar.dart';

part 'pokemon.g.dart';

@collection
class Pokemon {
  Pokemon({
    required this.name,
    this.frontDefault,
    this.height,
    this.weigh,
    this.baseStat,
  });
  Id isarId = Isar.autoIncrement;
  final String name;
  final String? frontDefault;
  final int? height;
  final int? weigh;
  final int? baseStat;
}
