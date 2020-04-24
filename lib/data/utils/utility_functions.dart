import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/apikeys.dart';


//Globals

enum MediaType {
  movies,
  tv,
  episode
}

enum ImgType {
  hdtvlogo,
  tvposter,
  // showbackground, 
  // hdclearart,
  // clearlogo,
  // seasonposter,
  // tvthumb,
  // characterart,
  // seasonthumb,
  // tvbanner,
  // clearart,
  // seasonbanner
}

enum ListCategory {
  trending, 
  popular,
  played,
  watched,
  collected, 
  anticipated, 
  updates,
}

Map<String, String> buildHeader(Client client) {
  Map<String, String> header;
  return header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${client.credentials.accessToken}',
    'trakt-api-version': '2',
    'trakt-api-key': '${client.identifier}',
  };
}

Image getPoster({String id, double scale}) { 
  var img = Image.network('https://img.omdbapi.com/?apikey=$key=$id', scale: scale);
  return img;
}
