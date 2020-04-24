// To parse this JSON data, do
//
//     final tVimgs = tVimgsFromJson(jsonString);

import 'dart:convert';

TVimgs tVimgsFromJson(String str) => TVimgs.fromJson(json.decode(str));

String tVimgsToJson(TVimgs data) => json.encode(data.toJson());

class TVimgs {
    String name;
    String thetvdbId;
    List<Characterart> hdtvlogo;
    List<Characterart> tvposter;
    List<Characterart> showbackground;
    List<Characterart> hdclearart;
    List<Characterart> clearlogo;
    List<Characterart> seasonposter;
    List<Characterart> tvthumb;
    List<Characterart> characterart;
    List<Characterart> seasonthumb;
    List<Characterart> tvbanner;
    List<Characterart> clearart;
    List<Characterart> seasonbanner;

    TVimgs({
        this.name,
        this.thetvdbId,
        this.hdtvlogo,
        this.tvposter,
        this.showbackground,
        this.hdclearart,
        this.clearlogo,
        this.seasonposter,
        this.tvthumb,
        this.characterart,
        this.seasonthumb,
        this.tvbanner,
        this.clearart,
        this.seasonbanner,
    });

    factory TVimgs.fromJson(Map<String, dynamic> json) => TVimgs(
        name: json["name"] == null ? null : json["name"],
        thetvdbId: json["thetvdb_id"] == null ? null : json["thetvdb_id"],
        hdtvlogo: json["hdtvlogo"] == null ? null : List<Characterart>.from(json["hdtvlogo"].map((x) => Characterart.fromJson(x))),
        tvposter: json["tvposter"] == null ? null : List<Characterart>.from(json["tvposter"].map((x) => Characterart.fromJson(x))),
        showbackground: json["showbackground"] == null ? null : List<Characterart>.from(json["showbackground"].map((x) => Characterart.fromJson(x))),
        hdclearart: json["hdclearart"] == null ? null : List<Characterart>.from(json["hdclearart"].map((x) => Characterart.fromJson(x))),
        clearlogo: json["clearlogo"] == null ? null : List<Characterart>.from(json["clearlogo"].map((x) => Characterart.fromJson(x))),
        seasonposter: json["seasonposter"] == null ? null : List<Characterart>.from(json["seasonposter"].map((x) => Characterart.fromJson(x))),
        tvthumb: json["tvthumb"] == null ? null : List<Characterart>.from(json["tvthumb"].map((x) => Characterart.fromJson(x))),
        characterart: json["characterart"] == null ? null : List<Characterart>.from(json["characterart"].map((x) => Characterart.fromJson(x))),
        seasonthumb: json["seasonthumb"] == null ? null : List<Characterart>.from(json["seasonthumb"].map((x) => Characterart.fromJson(x))),
        tvbanner: json["tvbanner"] == null ? null : List<Characterart>.from(json["tvbanner"].map((x) => Characterart.fromJson(x))),
        clearart: json["clearart"] == null ? null : List<Characterart>.from(json["clearart"].map((x) => Characterart.fromJson(x))),
        seasonbanner: json["seasonbanner"] == null ? null : List<Characterart>.from(json["seasonbanner"].map((x) => Characterart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "thetvdb_id": thetvdbId == null ? null : thetvdbId,
        "hdtvlogo": hdtvlogo == null ? null : List<dynamic>.from(hdtvlogo.map((x) => x.toJson())),
        "tvposter": tvposter == null ? null : List<dynamic>.from(tvposter.map((x) => x.toJson())),
        "showbackground": showbackground == null ? null : List<dynamic>.from(showbackground.map((x) => x.toJson())),
        "hdclearart": hdclearart == null ? null : List<dynamic>.from(hdclearart.map((x) => x.toJson())),
        "clearlogo": clearlogo == null ? null : List<dynamic>.from(clearlogo.map((x) => x.toJson())),
        "seasonposter": seasonposter == null ? null : List<dynamic>.from(seasonposter.map((x) => x.toJson())),
        "tvthumb": tvthumb == null ? null : List<dynamic>.from(tvthumb.map((x) => x.toJson())),
        "characterart": characterart == null ? null : List<dynamic>.from(characterart.map((x) => x.toJson())),
        "seasonthumb": seasonthumb == null ? null : List<dynamic>.from(seasonthumb.map((x) => x.toJson())),
        "tvbanner": tvbanner == null ? null : List<dynamic>.from(tvbanner.map((x) => x.toJson())),
        "clearart": clearart == null ? null : List<dynamic>.from(clearart.map((x) => x.toJson())),
        "seasonbanner": seasonbanner == null ? null : List<dynamic>.from(seasonbanner.map((x) => x.toJson())),
    };
}

class Characterart {
    String id;
    String url;
    Lang lang;
    String likes;
    String season;

    Characterart({
        this.id,
        this.url,
        this.lang,
        this.likes,
        this.season,
    });

    factory Characterart.fromJson(Map<String, dynamic> json) => Characterart(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        lang: json["lang"] == null ? null : langValues.map[json["lang"]],
        likes: json["likes"] == null ? null : json["likes"],
        season: json["season"] == null ? null : json["season"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "lang": lang == null ? null : langValues.reverse[lang],
        "likes": likes == null ? null : likes,
        "season": season == null ? null : season,
    };
}

enum Lang { EN, HU, RU, XX, HE, IT, EMPTY }

final langValues = EnumValues({
    "": Lang.EMPTY,
    "en": Lang.EN,
    "he": Lang.HE,
    "hu": Lang.HU,
    "it": Lang.IT,
    "ru": Lang.RU,
    "xx": Lang.XX
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
