
// To parse this JSON data, do
//
//     final pokemonList = pokemonListFromJson(jsonString);

import 'dart:convert';

PokemonList pokemonListFromJson(String str) => PokemonList.fromJson(json.decode(str));

String pokemonListToJson(PokemonList data) => json.encode(data.toJson());

class PokemonList {
    PokemonList({
        required this.count,
        required this.results,
    });

    final int count;
    final List<Result> results;

    factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        count: json["count"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.name,
        required this.url,
    });

    final String name;
    final String url;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
