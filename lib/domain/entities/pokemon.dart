import 'package:isar/isar.dart';

part 'pokemon.g.dart';

@collection
class Pokemon {
  Pokemon({
    required this.name,
    required this.isFav,
    this.frontDefault,
    this.height,
    this.weigh,
    this.gifDefault,
    this.hpStat,
    this.attackStat,
    this.defenseStat,
    this.specialAttackStat,
    this.specialDefenseStat,
    this.speedStat,
    this.move1,
    this.move2,
    this.move3,
    this.move4,
    this.move5,
    this.move6,
    this.move7,
    this.move8,
    this.move9,
    this.move10,
  });
  Id isarId = Isar.autoIncrement;
  final String name;
  final bool isFav;
  final String? frontDefault;
  final String? gifDefault;
  final int? height;
  final int? weigh;
  final int? hpStat;
  final int? attackStat;
  final int? defenseStat;
  final int? specialAttackStat;
  final int? specialDefenseStat;
  final int? speedStat;
  final String? move1;
  final String? move2;
  final String? move3;
  final String? move4;
  final String? move5;
  final String? move6;
  final String? move7;
  final String? move8;
  final String? move9;
  final String? move10;
}
