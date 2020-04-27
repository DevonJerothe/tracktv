import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/api/classes/sync/last_activity.dart';
import 'package:tracktv/data/api/classes/sync/myCollection.dart';
import 'package:tracktv/data/api/classes/tv_imgs.dart';
import 'package:tracktv/data/apikeys.dart';
import 'package:tracktv/data/utils/utility_functions.dart';

import 'classes/movie.dart';
import 'classes/show.dart';

class TraktAPI {
  LastActivity syncTimes;

  //Misc - some of these are not part of trakt api

  //fanart (img)
  Future<TVimgs> getShowImg(
      {ImgType type, Client client, String tvdbID}) async {
    final response =
        await client.get('${fanArtUrl}${tvdbID}?api_key=$fanArtKey');
    return tVimgsFromJson(response.body);
  }

  //Shows Calls
  Future<List<ShowLive>> getShows(
      {ListCategory type,
      Client client,
      bool extended = false,
      int limit = 15}) async {
    List<ShowLive> shows;
    String typeUrl = '';

    var response = await client.get(
        urlBase +
            'shows/${EnumToString.parse(type)}?extended=${(extended) ? 'full' : ''}&page=1&limit=$limit',
        headers: buildHeader(client));

    if (type != ListCategory.popular) {
      shows = List<ShowLive>.from(json.decode(response.body).map((x) {
        return ShowLive.fromJson(x);
      }));
    } else {
      shows = List<ShowLive>.from(json.decode(response.body).map((x) {
        return ShowLive.fromJsonPop(x);
      }));
    }

    return shows;
  }

  //Sync Calls
  Future<LastActivity> syncLastActivity({Client client}) async {
    var response = await client.get(urlBase + "sync/last_activities");
    return syncTimes = lastActivityFromJson(response.body);
  }

  Future<List<MyCollection>> syncMyCollection(
      {MediaType type, Client client}) async {
    String media = "";

    switch (type) {
      case MediaType.movies:
        media = 'movies';
        break;
      case MediaType.tv:
        media = 'shows';
        break;
      case MediaType.episode:
        media = 'episodes';
        break;
    }

    var response = await client.get(urlBase + "sync/collection/$media",
        headers: buildHeader(client));

    List<MyCollection> collection;

    return collection = myCollectionFromJson(response.body);
  }

  Future<void> syncAddToCollection(
      {Client client, List<Movie> movies, List<Show> shows}) {}
}
