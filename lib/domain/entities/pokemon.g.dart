// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPokemonCollection on Isar {
  IsarCollection<Pokemon> get pokemons => this.collection();
}

const PokemonSchema = CollectionSchema(
  name: r'Pokemon',
  id: -6363737917301323018,
  properties: {
    r'attackStat': PropertySchema(
      id: 0,
      name: r'attackStat',
      type: IsarType.long,
    ),
    r'defenseStat': PropertySchema(
      id: 1,
      name: r'defenseStat',
      type: IsarType.long,
    ),
    r'frontDefault': PropertySchema(
      id: 2,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'gifDefault': PropertySchema(
      id: 3,
      name: r'gifDefault',
      type: IsarType.string,
    ),
    r'height': PropertySchema(
      id: 4,
      name: r'height',
      type: IsarType.long,
    ),
    r'hpStat': PropertySchema(
      id: 5,
      name: r'hpStat',
      type: IsarType.long,
    ),
    r'move1': PropertySchema(
      id: 6,
      name: r'move1',
      type: IsarType.string,
    ),
    r'move10': PropertySchema(
      id: 7,
      name: r'move10',
      type: IsarType.string,
    ),
    r'move2': PropertySchema(
      id: 8,
      name: r'move2',
      type: IsarType.string,
    ),
    r'move3': PropertySchema(
      id: 9,
      name: r'move3',
      type: IsarType.string,
    ),
    r'move4': PropertySchema(
      id: 10,
      name: r'move4',
      type: IsarType.string,
    ),
    r'move5': PropertySchema(
      id: 11,
      name: r'move5',
      type: IsarType.string,
    ),
    r'move6': PropertySchema(
      id: 12,
      name: r'move6',
      type: IsarType.string,
    ),
    r'move7': PropertySchema(
      id: 13,
      name: r'move7',
      type: IsarType.string,
    ),
    r'move8': PropertySchema(
      id: 14,
      name: r'move8',
      type: IsarType.string,
    ),
    r'move9': PropertySchema(
      id: 15,
      name: r'move9',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 16,
      name: r'name',
      type: IsarType.string,
    ),
    r'specialAttackStat': PropertySchema(
      id: 17,
      name: r'specialAttackStat',
      type: IsarType.long,
    ),
    r'specialDefenseStat': PropertySchema(
      id: 18,
      name: r'specialDefenseStat',
      type: IsarType.long,
    ),
    r'speedStat': PropertySchema(
      id: 19,
      name: r'speedStat',
      type: IsarType.long,
    ),
    r'weigh': PropertySchema(
      id: 20,
      name: r'weigh',
      type: IsarType.long,
    )
  },
  estimateSize: _pokemonEstimateSize,
  serialize: _pokemonSerialize,
  deserialize: _pokemonDeserialize,
  deserializeProp: _pokemonDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pokemonGetId,
  getLinks: _pokemonGetLinks,
  attach: _pokemonAttach,
  version: '3.1.0+1',
);

int _pokemonEstimateSize(
  Pokemon object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gifDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move10;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move3;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move4;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move5;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move6;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move7;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move8;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.move9;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _pokemonSerialize(
  Pokemon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attackStat);
  writer.writeLong(offsets[1], object.defenseStat);
  writer.writeString(offsets[2], object.frontDefault);
  writer.writeString(offsets[3], object.gifDefault);
  writer.writeLong(offsets[4], object.height);
  writer.writeLong(offsets[5], object.hpStat);
  writer.writeString(offsets[6], object.move1);
  writer.writeString(offsets[7], object.move10);
  writer.writeString(offsets[8], object.move2);
  writer.writeString(offsets[9], object.move3);
  writer.writeString(offsets[10], object.move4);
  writer.writeString(offsets[11], object.move5);
  writer.writeString(offsets[12], object.move6);
  writer.writeString(offsets[13], object.move7);
  writer.writeString(offsets[14], object.move8);
  writer.writeString(offsets[15], object.move9);
  writer.writeString(offsets[16], object.name);
  writer.writeLong(offsets[17], object.specialAttackStat);
  writer.writeLong(offsets[18], object.specialDefenseStat);
  writer.writeLong(offsets[19], object.speedStat);
  writer.writeLong(offsets[20], object.weigh);
}

Pokemon _pokemonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pokemon(
    attackStat: reader.readLongOrNull(offsets[0]),
    defenseStat: reader.readLongOrNull(offsets[1]),
    frontDefault: reader.readStringOrNull(offsets[2]),
    gifDefault: reader.readStringOrNull(offsets[3]),
    height: reader.readLongOrNull(offsets[4]),
    hpStat: reader.readLongOrNull(offsets[5]),
    move1: reader.readStringOrNull(offsets[6]),
    move10: reader.readStringOrNull(offsets[7]),
    move2: reader.readStringOrNull(offsets[8]),
    move3: reader.readStringOrNull(offsets[9]),
    move4: reader.readStringOrNull(offsets[10]),
    move5: reader.readStringOrNull(offsets[11]),
    move6: reader.readStringOrNull(offsets[12]),
    move7: reader.readStringOrNull(offsets[13]),
    move8: reader.readStringOrNull(offsets[14]),
    move9: reader.readStringOrNull(offsets[15]),
    name: reader.readString(offsets[16]),
    specialAttackStat: reader.readLongOrNull(offsets[17]),
    specialDefenseStat: reader.readLongOrNull(offsets[18]),
    speedStat: reader.readLongOrNull(offsets[19]),
    weigh: reader.readLongOrNull(offsets[20]),
  );
  object.isarId = id;
  return object;
}

P _pokemonDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pokemonGetId(Pokemon object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _pokemonGetLinks(Pokemon object) {
  return [];
}

void _pokemonAttach(IsarCollection<dynamic> col, Id id, Pokemon object) {
  object.isarId = id;
}

extension PokemonQueryWhereSort on QueryBuilder<Pokemon, Pokemon, QWhere> {
  QueryBuilder<Pokemon, Pokemon, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PokemonQueryWhere on QueryBuilder<Pokemon, Pokemon, QWhereClause> {
  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PokemonQueryFilter
    on QueryBuilder<Pokemon, Pokemon, QFilterCondition> {
  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> attackStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attackStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> attackStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attackStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> attackStatEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attackStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> attackStatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attackStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> attackStatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attackStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> attackStatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attackStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> defenseStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defenseStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> defenseStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defenseStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> defenseStatEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defenseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> defenseStatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defenseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> defenseStatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defenseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> defenseStatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defenseStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gifDefault',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gifDefault',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gifDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gifDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gifDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gifDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gifDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gifDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gifDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gifDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gifDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> gifDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gifDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> heightEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> heightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> heightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> heightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> hpStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hpStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> hpStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hpStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> hpStatEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hpStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> hpStatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hpStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> hpStatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hpStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> hpStatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hpStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move1',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move1',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move1',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move1',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move10',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move10',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move10',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move10',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move10',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move10',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move10',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move10',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move10',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move10',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move10',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move10IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move10',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move2',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move2',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move2',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move2',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move3',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move3',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move3',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move3',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move4',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move4',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move4',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move4',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move4',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move4IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move4',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move5',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move5',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move5',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move5',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move5',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move5IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move5',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move6',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move6',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move6',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move6',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move6',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move6',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move6',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move6',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move6',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move6',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move6',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move6IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move6',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move7',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move7',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move7',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move7',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move7',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move7',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move7',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move7',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move7',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move7',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move7',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move7IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move7',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move8',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move8',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move8',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move8',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move8',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move8',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move8',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move8',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move8',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move8',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move8',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move8IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move8',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move9',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move9',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move9',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'move9',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'move9',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'move9',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'move9',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'move9',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'move9',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'move9',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'move9',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> move9IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'move9',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialAttackStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'specialAttackStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialAttackStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'specialAttackStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialAttackStatEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialAttackStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialAttackStatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'specialAttackStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialAttackStatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'specialAttackStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialAttackStatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'specialAttackStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialDefenseStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'specialDefenseStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialDefenseStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'specialDefenseStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialDefenseStatEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialDefenseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialDefenseStatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'specialDefenseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialDefenseStatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'specialDefenseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition>
      specialDefenseStatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'specialDefenseStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> speedStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speedStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> speedStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speedStat',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> speedStatEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speedStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> speedStatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speedStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> speedStatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speedStat',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> speedStatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speedStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> weighIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weigh',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> weighIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weigh',
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> weighEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weigh',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> weighGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weigh',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> weighLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weigh',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterFilterCondition> weighBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weigh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PokemonQueryObject
    on QueryBuilder<Pokemon, Pokemon, QFilterCondition> {}

extension PokemonQueryLinks
    on QueryBuilder<Pokemon, Pokemon, QFilterCondition> {}

extension PokemonQuerySortBy on QueryBuilder<Pokemon, Pokemon, QSortBy> {
  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByAttackStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attackStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByAttackStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attackStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByDefenseStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defenseStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByDefenseStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defenseStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByFrontDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontDefault', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByFrontDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontDefault', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByGifDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gifDefault', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByGifDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gifDefault', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByHpStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByHpStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move1', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move1', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove10() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move10', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove10Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move10', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move2', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move2', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move3', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move3', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move4', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move4', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move5', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move5', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove6() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move6', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove6Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move6', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove7() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move7', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove7Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move7', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove8() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move8', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove8Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move8', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove9() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move9', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByMove9Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move9', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortBySpecialAttackStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialAttackStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortBySpecialAttackStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialAttackStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortBySpecialDefenseStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialDefenseStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortBySpecialDefenseStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialDefenseStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortBySpeedStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortBySpeedStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByWeigh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weigh', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> sortByWeighDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weigh', Sort.desc);
    });
  }
}

extension PokemonQuerySortThenBy
    on QueryBuilder<Pokemon, Pokemon, QSortThenBy> {
  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByAttackStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attackStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByAttackStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attackStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByDefenseStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defenseStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByDefenseStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defenseStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByFrontDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontDefault', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByFrontDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frontDefault', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByGifDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gifDefault', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByGifDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gifDefault', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByHpStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByHpStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hpStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move1', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move1', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove10() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move10', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove10Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move10', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move2', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move2', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move3', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move3', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move4', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move4', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move5', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move5', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove6() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move6', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove6Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move6', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove7() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move7', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove7Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move7', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove8() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move8', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove8Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move8', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove9() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move9', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByMove9Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'move9', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenBySpecialAttackStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialAttackStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenBySpecialAttackStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialAttackStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenBySpecialDefenseStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialDefenseStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenBySpecialDefenseStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialDefenseStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenBySpeedStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedStat', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenBySpeedStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedStat', Sort.desc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByWeigh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weigh', Sort.asc);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QAfterSortBy> thenByWeighDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weigh', Sort.desc);
    });
  }
}

extension PokemonQueryWhereDistinct
    on QueryBuilder<Pokemon, Pokemon, QDistinct> {
  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByAttackStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attackStat');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByDefenseStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defenseStat');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByFrontDefault(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frontDefault', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByGifDefault(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gifDefault', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByHpStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hpStat');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove10(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move10', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove4(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move4', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove5(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move5', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove6(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move6', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove7(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move7', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove8(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move8', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByMove9(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'move9', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctBySpecialAttackStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'specialAttackStat');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctBySpecialDefenseStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'specialDefenseStat');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctBySpeedStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speedStat');
    });
  }

  QueryBuilder<Pokemon, Pokemon, QDistinct> distinctByWeigh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weigh');
    });
  }
}

extension PokemonQueryProperty
    on QueryBuilder<Pokemon, Pokemon, QQueryProperty> {
  QueryBuilder<Pokemon, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> attackStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attackStat');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> defenseStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defenseStat');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> frontDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frontDefault');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> gifDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gifDefault');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> hpStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hpStat');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move1');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move10Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move10');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move2');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move3');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move4');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move5Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move5');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move6Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move6');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move7Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move7');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move8Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move8');
    });
  }

  QueryBuilder<Pokemon, String?, QQueryOperations> move9Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move9');
    });
  }

  QueryBuilder<Pokemon, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> specialAttackStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'specialAttackStat');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> specialDefenseStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'specialDefenseStat');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> speedStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speedStat');
    });
  }

  QueryBuilder<Pokemon, int?, QQueryOperations> weighProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weigh');
    });
  }
}
