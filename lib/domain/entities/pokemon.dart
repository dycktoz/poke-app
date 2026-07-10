class EvolutionStep {
  final String name;
  final int id;
  final String imageUrl;

  EvolutionStep({
    required this.name,
    required this.id,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'imageUrl': imageUrl,
    };
  }

  factory EvolutionStep.fromJson(Map<String, dynamic> json) {
    return EvolutionStep(
      name: json['name'] as String,
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }
}

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String? gifUrl;
  final int? height;
  final int? weight;
  final List<String> types;
  final List<String> abilities;
  final Map<String, int> stats;
  final List<String> moves;
  final String? description;
  final bool isFavorite;
  final List<EvolutionStep> evolutions;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.gifUrl,
    this.height,
    this.weight,
    required this.types,
    required this.abilities,
    required this.stats,
    required this.moves,
    this.description,
    this.isFavorite = false,
    this.evolutions = const [],
  });

  Pokemon copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? gifUrl,
    int? height,
    int? weight,
    List<String>? types,
    List<String>? abilities,
    Map<String, int>? stats,
    List<String>? moves,
    String? description,
    bool? isFavorite,
    List<EvolutionStep>? evolutions,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      gifUrl: gifUrl ?? this.gifUrl,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      abilities: abilities ?? this.abilities,
      stats: stats ?? this.stats,
      moves: moves ?? this.moves,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      evolutions: evolutions ?? this.evolutions,
    );
  }
}
