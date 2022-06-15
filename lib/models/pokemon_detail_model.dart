
// To parse this JSON data, do
//
//     final pokemonDetail = pokemonDetailFromJson(jsonString);

import 'dart:convert';

List<PokemonDetail> pokemonDetailFromJson(String str) => List<PokemonDetail>.from(json.decode(str).map((x) => PokemonDetail.fromJson(x)));

String pokemonDetailToJson(List<PokemonDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokemonDetail {
    PokemonDetail({
        required this.baseStat,
        required this.effort,
        required this.stat,
    });

    final int baseStat;
    final int effort;
    final Stat stat;

    factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Stat.fromJson(json["stat"]),
    );

    Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
    };
}

class Stat {
    Stat({
        required this.name,
        required this.url,
    });

    final String name;
    final String url;

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
