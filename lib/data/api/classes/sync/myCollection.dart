// To parse this JSON data, do
//
//     final myCollection = myCollectionFromJson(jsonString);

import 'dart:convert';

import '../movie.dart';
import '../show.dart';

List<MyCollection> myCollectionFromJson(String str) => List<MyCollection>.from(json.decode(str).map((x) => MyCollection.fromJson(x)));

String myCollectionToJson(List<MyCollection> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyCollection {
    DateTime collectedAt;
    DateTime updatedAt;
    Movie movie;
    DateTime lastCollectedAt;
    DateTime lastUpdatedAt;
    Show show;
    List<Season> seasons;

    MyCollection({
        this.collectedAt,
        this.updatedAt,
        this.movie,
        this.lastCollectedAt,
        this.lastUpdatedAt,
        this.show,
        this.seasons,
    });

    factory MyCollection.fromJson(Map<String, dynamic> json) => MyCollection(
        collectedAt: json["collected_at"] == null ? null : DateTime.parse(json["collected_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        lastCollectedAt: json["last_collected_at"] == null ? null : DateTime.parse(json["last_collected_at"]),
        lastUpdatedAt: json["last_updated_at"] == null ? null : DateTime.parse(json["last_updated_at"]),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
        seasons: json["seasons"] == null ? null : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "collected_at": collectedAt == null ? null : collectedAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "movie": movie == null ? null : movie.toJson(),
        "last_collected_at": lastCollectedAt == null ? null : lastCollectedAt.toIso8601String(),
        "last_updated_at": lastUpdatedAt == null ? null : lastUpdatedAt.toIso8601String(),
        "show": show == null ? null : show.toJson(),
        "seasons": seasons == null ? null : List<dynamic>.from(seasons.map((x) => x.toJson())),
    };
}

class MovieIds {
    int trakt;
    String slug;
    String imdb;
    int tmdb;

    MovieIds({
        this.trakt,
        this.slug,
        this.imdb,
        this.tmdb,
    });

    factory MovieIds.fromJson(Map<String, dynamic> json) => MovieIds(
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

class Season {
    int number;
    List<Episode> episodes;

    Season({
        this.number,
        this.episodes,
    });

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        number: json["number"] == null ? null : json["number"],
        episodes: json["episodes"] == null ? null : List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "episodes": episodes == null ? null : List<dynamic>.from(episodes.map((x) => x.toJson())),
    };
}

class Episode {
    int number;
    DateTime collectedAt;

    Episode({
        this.number,
        this.collectedAt,
    });

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        number: json["number"] == null ? null : json["number"],
        collectedAt: json["collected_at"] == null ? null : DateTime.parse(json["collected_at"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "collected_at": collectedAt == null ? null : collectedAt.toIso8601String(),
    };
}

class ShowIds {
    int trakt;
    String slug;
    int tvdb;
    String imdb;
    int tmdb;
    int tvrage;

    ShowIds({
        this.trakt,
        this.slug,
        this.tvdb,
        this.imdb,
        this.tmdb,
        this.tvrage,
    });

    factory ShowIds.fromJson(Map<String, dynamic> json) => ShowIds(
        trakt: json["trakt"] == null ? null : json["trakt"],
        slug: json["slug"] == null ? null : json["slug"],
        tvdb: json["tvdb"] == null ? null : json["tvdb"],
        imdb: json["imdb"] == null ? null : json["imdb"],
        tmdb: json["tmdb"] == null ? null : json["tmdb"],
        tvrage: json["tvrage"] == null ? null : json["tvrage"],
    );

    Map<String, dynamic> toJson() => {
        "trakt": trakt == null ? null : trakt,
        "slug": slug == null ? null : slug,
        "tvdb": tvdb == null ? null : tvdb,
        "imdb": imdb == null ? null : imdb,
        "tmdb": tmdb == null ? null : tmdb,
        "tvrage": tvrage == null ? null : tvrage,
    };
}
