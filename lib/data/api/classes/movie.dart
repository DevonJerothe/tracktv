// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

import 'package:tracktv/data/api/classes/sync/myCollection.dart';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
    DateTime collectedAt;
    String title;
    int year;
    Ids ids;

    Movie({
        this.collectedAt,
        this.title,
        this.year,
        this.ids,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        collectedAt: json["collected_at"] == null ? null : DateTime.parse(json["collected_at"]),
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
    );

    Map<String, dynamic> toJson() => {
        "collected_at": collectedAt == null ? null : collectedAt.toIso8601String(),
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "ids": ids == null ? null : ids.toJson(),
    };
}

class Ids {
    int trakt;
    String slug;
    String imdb;
    int tmdb;

    Ids({
        this.trakt,
        this.slug,
        this.imdb,
        this.tmdb,
    });

    factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        trakt: json["trakt"] == null ? null : json["trakt"],
        slug: json["slug"] == null ? null : json["slug"],
        imdb: json["imdb"] == null ? null : json["imdb"],
        tmdb: json["tmdb"] == null ? null : json["tmdb"],
    );

    Map<String, dynamic> toJson() => {
        "trakt": trakt == null ? null : trakt,
        "slug": slug == null ? null : slug,
        "imdb": imdb == null ? null : imdb,
        "tmdb": tmdb == null ? null : tmdb,
    };
}
