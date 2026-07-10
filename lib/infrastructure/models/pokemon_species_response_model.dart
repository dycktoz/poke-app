class PokemonSpeciesResponseModel {
  final List<FlavorTextEntry> flavorTextEntries;

  PokemonSpeciesResponseModel({required this.flavorTextEntries});

  factory PokemonSpeciesResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesResponseModel(
      flavorTextEntries: (json['flavor_text_entries'] as List? ?? [])
          .map((x) => FlavorTextEntry.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }
}

class FlavorTextEntry {
  final String flavorText;
  final Species language;

  FlavorTextEntry({required this.flavorText, required this.language});

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntry(
      flavorText: json['flavor_text'] as String? ?? '',
      language: Species.fromJson(json['language'] as Map<String, dynamic>),
    );
  }
}

class Species {
  final String name;

  Species({required this.name});

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'] as String? ?? '',
    );
  }
}
