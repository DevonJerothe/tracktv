// To parse this JSON data, do
//
//     final lastActivity = lastActivityFromJson(jsonString);

import 'dart:convert';

LastActivity lastActivityFromJson(String str) => LastActivity.fromJson(json.decode(str));

String lastActivityToJson(LastActivity data) => json.encode(data.toJson());

class LastActivity {
    DateTime all;
    Episodes movies;
    Episodes episodes;
    Seasons shows;
    Seasons seasons;
    Comments comments;
    Lists lists;
    Account account;

    LastActivity({
        this.all,
        this.movies,
        this.episodes,
        this.shows,
        this.seasons,
        this.comments,
        this.lists,
        this.account,
    });

    factory LastActivity.fromJson(Map<String, dynamic> json) => LastActivity(
        all: json["all"] == null ? null : DateTime.parse(json["all"]),
        movies: json["movies"] == null ? null : Episodes.fromJson(json["movies"]),
        episodes: json["episodes"] == null ? null : Episodes.fromJson(json["episodes"]),
        shows: json["shows"] == null ? null : Seasons.fromJson(json["shows"]),
        seasons: json["seasons"] == null ? null : Seasons.fromJson(json["seasons"]),
        comments: json["comments"] == null ? null : Comments.fromJson(json["comments"]),
        lists: json["lists"] == null ? null : Lists.fromJson(json["lists"]),
        account: json["account"] == null ? null : Account.fromJson(json["account"]),
    );

    Map<String, dynamic> toJson() => {
        "all": all == null ? null : all.toIso8601String(),
        "movies": movies == null ? null : movies.toJson(),
        "episodes": episodes == null ? null : episodes.toJson(),
        "shows": shows == null ? null : shows.toJson(),
        "seasons": seasons == null ? null : seasons.toJson(),
        "comments": comments == null ? null : comments.toJson(),
        "lists": lists == null ? null : lists.toJson(),
        "account": account == null ? null : account.toJson(),
    };
}

class Account {
    DateTime settingsAt;

    Account({
        this.settingsAt,
    });

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        settingsAt: json["settings_at"] == null ? null : DateTime.parse(json["settings_at"]),
    );

    Map<String, dynamic> toJson() => {
        "settings_at": settingsAt == null ? null : settingsAt.toIso8601String(),
    };
}

class Comments {
    DateTime likedAt;

    Comments({
        this.likedAt,
    });

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        likedAt: json["liked_at"] == null ? null : DateTime.parse(json["liked_at"]),
    );

    Map<String, dynamic> toJson() => {
        "liked_at": likedAt == null ? null : likedAt.toIso8601String(),
    };
}

class Episodes {
    DateTime watchedAt;
    DateTime collectedAt;
    DateTime ratedAt;
    DateTime watchlistedAt;
    DateTime commentedAt;
    DateTime pausedAt;
    DateTime hiddenAt;

    Episodes({
        this.watchedAt,
        this.collectedAt,
        this.ratedAt,
        this.watchlistedAt,
        this.commentedAt,
        this.pausedAt,
        this.hiddenAt,
    });

    factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        watchedAt: json["watched_at"] == null ? null : DateTime.parse(json["watched_at"]),
        collectedAt: json["collected_at"] == null ? null : DateTime.parse(json["collected_at"]),
        ratedAt: json["rated_at"] == null ? null : DateTime.parse(json["rated_at"]),
        watchlistedAt: json["watchlisted_at"] == null ? null : DateTime.parse(json["watchlisted_at"]),
        commentedAt: json["commented_at"] == null ? null : DateTime.parse(json["commented_at"]),
        pausedAt: json["paused_at"] == null ? null : DateTime.parse(json["paused_at"]),
        hiddenAt: json["hidden_at"] == null ? null : DateTime.parse(json["hidden_at"]),
    );

    Map<String, dynamic> toJson() => {
        "watched_at": watchedAt == null ? null : watchedAt.toIso8601String(),
        "collected_at": collectedAt == null ? null : collectedAt.toIso8601String(),
        "rated_at": ratedAt == null ? null : ratedAt.toIso8601String(),
        "watchlisted_at": watchlistedAt == null ? null : watchlistedAt.toIso8601String(),
        "commented_at": commentedAt == null ? null : commentedAt.toIso8601String(),
        "paused_at": pausedAt == null ? null : pausedAt.toIso8601String(),
        "hidden_at": hiddenAt == null ? null : hiddenAt.toIso8601String(),
    };
}

class Lists {
    DateTime likedAt;
    DateTime updatedAt;
    DateTime commentedAt;

    Lists({
        this.likedAt,
        this.updatedAt,
        this.commentedAt,
    });

    factory Lists.fromJson(Map<String, dynamic> json) => Lists(
        likedAt: json["liked_at"] == null ? null : DateTime.parse(json["liked_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        commentedAt: json["commented_at"] == null ? null : DateTime.parse(json["commented_at"]),
    );

    Map<String, dynamic> toJson() => {
        "liked_at": likedAt == null ? null : likedAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "commented_at": commentedAt == null ? null : commentedAt.toIso8601String(),
    };
}

class Seasons {
    DateTime ratedAt;
    DateTime watchlistedAt;
    DateTime commentedAt;
    DateTime hiddenAt;

    Seasons({
        this.ratedAt,
        this.watchlistedAt,
        this.commentedAt,
        this.hiddenAt,
    });

    factory Seasons.fromJson(Map<String, dynamic> json) => Seasons(
        ratedAt: json["rated_at"] == null ? null : DateTime.parse(json["rated_at"]),
        watchlistedAt: json["watchlisted_at"] == null ? null : DateTime.parse(json["watchlisted_at"]),
        commentedAt: json["commented_at"] == null ? null : DateTime.parse(json["commented_at"]),
        hiddenAt: json["hidden_at"] == null ? null : DateTime.parse(json["hidden_at"]),
    );

    Map<String, dynamic> toJson() => {
        "rated_at": ratedAt == null ? null : ratedAt.toIso8601String(),
        "watchlisted_at": watchlistedAt == null ? null : watchlistedAt.toIso8601String(),
        "commented_at": commentedAt == null ? null : commentedAt.toIso8601String(),
        "hidden_at": hiddenAt == null ? null : hiddenAt.toIso8601String(),
    };
}
