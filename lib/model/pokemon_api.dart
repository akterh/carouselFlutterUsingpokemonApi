// To parse this JSON data, do
//
//     final pokemonApiResult = pokemonApiResultFromJson(jsonString);

import 'dart:convert';

PokemonApiResult pokemonApiResultFromJson(String str) => PokemonApiResult.fromJson(json.decode(str));

String pokemonApiResultToJson(PokemonApiResult data) => json.encode(data.toJson());

class PokemonApiResult {
  PokemonApiResult({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory PokemonApiResult.fromJson(Map<String, dynamic> json) => PokemonApiResult(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
