// To parse this JSON data, do
//
//     final show = showFromJson(jsonString);

import 'dart:convert';

Show showFromJson(String str) => Show.fromJson(json.decode(str));

String showToJson(Show data) => json.encode(data.toJson());

class Show {
    String title;
    int year;
    Ids ids;
    List<Season> seasons;
    String overview;
    DateTime firstAired;
    Airs airs;
    int runtime;
    String certification;
    String network;
    String country;
    DateTime updatedAt;
    dynamic trailer;
    String homepage;
    String status;
    double rating;
    int votes;
    int commentCount;
    String language;
    List<String> availableTranslations;
    List<String> genres;
    int airedEpisodes;

    Show({
        this.title,
        this.year,
        this.ids,
        this.seasons,
        this.overview,
        this.firstAired,
        this.airs,
        this.runtime,
        this.certification,
        this.network,
        this.country,
        this.updatedAt,
        this.trailer,
        this.homepage,
        this.status,
        this.rating,
        this.votes,
        this.commentCount,
        this.language,
        this.availableTranslations,
        this.genres,
        this.airedEpisodes,
    });

    factory Show.fromJson(Map<String, dynamic> json) => Show(
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        seasons: json["seasons"] == null ? null : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        overview: json["overview"] == null ? null : json["overview"],
        firstAired: json["first_aired"] == null ? null : DateTime.parse(json["first_aired"]),
        airs: json["airs"] == null ? null : Airs.fromJson(json["airs"]),
        runtime: json["runtime"] == null ? null : json["runtime"],
        certification: json["certification"] == null ? null : json["certification"],
        network: json["network"] == null ? null : json["network"],
        country: json["country"] == null ? null : json["country"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        trailer: json["trailer"],
        homepage: json["homepage"] == null ? null : json["homepage"],
        status: json["status"] == null ? null : json["status"],
        rating: json["rating"] == null ? null : json["rating"],
        votes: json["votes"] == null ? null : json["votes"],
        commentCount: json["comment_count"] == null ? null : json["comment_count"],
        language: json["language"] == null ? null : json["language"],
        availableTranslations: json["available_translations"] == null ? null : List<String>.from(json["available_translations"].map((x) => x)),
        genres: json["genres"] == null ? null : List<String>.from(json["genres"].map((x) => x)),
        airedEpisodes: json["aired_episodes"] == null ? null : json["aired_episodes"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "ids": ids == null ? null : ids.toJson(),
        "seasons": seasons == null ? null : List<dynamic>.from(seasons.map((x) => x.toJson())),
        "overview": overview == null ? null : overview,
        "first_aired": firstAired == null ? null : firstAired.toIso8601String(),
        "airs": airs == null ? null : airs.toJson(),
        "runtime": runtime == null ? null : runtime,
        "certification": certification == null ? null : certification,
        "network": network == null ? null : network,
        "country": country == null ? null : country,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "trailer": trailer,
        "homepage": homepage == null ? null : homepage,
        "status": status == null ? null : status,
        "rating": rating == null ? null : rating,
        "votes": votes == null ? null : votes,
        "comment_count": commentCount == null ? null : commentCount,
        "language": language == null ? null : language,
        "available_translations": availableTranslations == null ? null : List<dynamic>.from(availableTranslations.map((x) => x)),
        "genres": genres == null ? null : List<dynamic>.from(genres.map((x) => x)),
        "aired_episodes": airedEpisodes == null ? null : airedEpisodes,
    };
}

class Airs {
    String day;
    String time;
    String timezone;

    Airs({
        this.day,
        this.time,
        this.timezone,
    });

    factory Airs.fromJson(Map<String, dynamic> json) => Airs(
        day: json["day"] == null ? null : json["day"],
        time: json["time"] == null ? null : json["time"],
        timezone: json["timezone"] == null ? null : json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "time": time == null ? null : time,
        "timezone": timezone == null ? null : timezone,
    };
}

class Ids {
    int trakt;
    String slug;
    int tvdb;
    String imdb;
    int tmdb;

    Ids({
        this.trakt,
        this.slug,
        this.tvdb,
        this.imdb,
        this.tmdb,
    });

    factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        trakt: json["trakt"] == null ? null : json["trakt"],
        slug: json["slug"] == null ? null : json["slug"],
        tvdb: json["tvdb"] == null ? null : json["tvdb"],
        imdb: json["imdb"] == null ? null : json["imdb"],
        tmdb: json["tmdb"] == null ? null : json["tmdb"],
    );

    Map<String, dynamic> toJson() => {
        "trakt": trakt == null ? null : trakt,
        "slug": slug == null ? null : slug,
        "tvdb": tvdb == null ? null : tvdb,
        "imdb": imdb == null ? null : imdb,
        "tmdb": tmdb == null ? null : tmdb,
    };
}

class Season {
    DateTime collectedAt;
    Ids ids;
    int number;
    List<Episode> episodes;

    Season({
        this.collectedAt,
        this.ids,
        this.number,
        this.episodes,
    });

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        collectedAt: json["collected_at"] == null ? null : DateTime.parse(json["collected_at"]),
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        number: json["number"] == null ? null : json["number"],
        episodes: json["episodes"] == null ? null : List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "collected_at": collectedAt == null ? null : collectedAt.toIso8601String(),
        "ids": ids == null ? null : ids.toJson(),
        "number": number == null ? null : number,
        "episodes": episodes == null ? null : List<dynamic>.from(episodes.map((x) => x.toJson())),
    };
}

class Episode {
    String title;
    DateTime collectedAt;
    Ids ids;
    int number;

    Episode({
        this.title,
        this.collectedAt,
        this.ids,
        this.number,
    });

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        title: json["title"] == null ? null : json["title"],
        collectedAt: json["collected_at"] == null ? null : DateTime.parse(json["collected_at"]),
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
        number: json["number"] == null ? null : json["number"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "collected_at": collectedAt == null ? null : collectedAt.toIso8601String(),
        "ids": ids == null ? null : ids.toJson(),
        "number": number == null ? null : number,
    };
}