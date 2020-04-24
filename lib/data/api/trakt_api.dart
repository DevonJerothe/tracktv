import 'dart:convert';

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
  Future<TVimgs> getShowImg({ImgType type, Client client, String tvdbID}) async{

    String imgURL = '';

    var response = await client.get('${fanArtUrl}${tvdbID}?api_key=$fanArtKey');

    final imgs = tVimgsFromJson(response.body);

    // switch (type) {
    //   case ImgType.hdtvlogo:
    //     int vote = 0;
    //     for (var logo in imgs.hdtvlogo) {
    //       if(int.parse(logo.likes) > vote){
    //         vote = int.parse(logo.likes);
    //         imgURL = logo.url;
    //       }
    //     }
    //     break;
    //   case ImgType.tvposter:
    //     int vote = 0;
    //     for (var logo in imgs.tvposter) {
    //       if(int.parse(logo.likes) > vote){
    //         vote = int.parse(logo.likes);
    //         imgURL = logo.url;
    //       }
    //     }
    //     break;
    //   default:
    // }

    return imgs;
  }


  //Shows Calls
  Future<List<Show>> getShows({ListCategory type, Client client, bool extended = false}) async{
    List<Show> shows;
    String typeUrl = '';

    switch (type) {
      case ListCategory.trending:
        typeUrl = 'trending';
        break;
      default:
    }

    var response = await client.get(urlBase + 'shows/${typeUrl}?extended=full&page=1&limit=5', headers: buildHeader(client));

    shows = List<Show>.from(json.decode(response.body).map((x) {
      return Show.fromJson(x["show"]);
    }));

    return shows;
  }

  //Sync Calls
  Future<LastActivity> syncLastActivity({Client client}) async{
    var response = await client.get(urlBase + "sync/last_activities");
    return syncTimes = lastActivityFromJson(response.body);
  }

  Future<List<MyCollection>> syncMyCollection({MediaType type, Client client}) async{
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

    var response = await client.get(urlBase + "sync/collection/$media", headers: buildHeader(client));

    List<MyCollection> collection;

    return collection = myCollectionFromJson(response.body);
  }  

  Future<void> syncAddToCollection({Client client, List<Movie> movies, List<Show> shows}) {
  
    
    
  }

}