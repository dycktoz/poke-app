// To parse this JSON data, do
//
//     final pokeList = pokeListFromJson(jsonString);

import 'dart:convert';

PokeListResponseModel pokeListFromJson(String str) =>
    PokeListResponseModel.fromJson(json.decode(str));

String pokeListToJson(PokeListResponseModel data) => json.encode(data.toJson());

class PokeListResponseModel {
  final int count;
  final String next;
  final dynamic previous;
  final List<Result> results;

  PokeListResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokeListResponseModel.fromJson(Map<String, dynamic> json) =>
      PokeListResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  final String name;
  final String url;

  Result({
    required this.name,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
