import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/api/classes/show.dart';
import 'package:tracktv/data/api/trakt_api.dart';
import 'package:tracktv/data/db/database.dart';
import 'package:tracktv/data/utils/utility_functions.dart';

part 'refresh_event.dart';
part 'refresh_state.dart';

class RefreshBloc extends Bloc<RefreshEvent, RefreshState> {
  @override
  RefreshState get initialState => RefreshInitial();

  @override
  Stream<RefreshState> mapEventToState(
    RefreshEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is Refresh){
      yield* _mapRefresh(event);
    }
  }

  Stream<RefreshState> _mapRefresh(Refresh event) async* {
    var trendingTV = await TraktAPI().getShows(
        type: ListCategory.trending, client: event.client, extended: true);

    var popularTV = await TraktAPI().getShows(
        type: ListCategory.popular, client: event.client, extended: true);

    var anticipatedTV = await TraktAPI().getShows(
        type: ListCategory.trending, client: event.client, extended: true);

    await refreshImgs(trending: trendingTV, popular: popularTV, anticipated: anticipatedTV, client: event.client);

    yield Refreshed(tAnt: anticipatedTV, tPop: popularTV, tTrend: trendingTV);
  }

  Future<bool> refreshImgs({
    List<ShowLive> trending,
    List<ShowLive> popular,
    List<ShowLive> anticipated,
    Client client,
  }) async {
    for (var show in trending) {
      var img = await TraktAPI().getShowImg(
        client: client,
        tvdbID: show.show.ids.tvdb.toString()
      );
      GetIt.instance<DatabaseService>().tVShowsDao.insertTVImgs(img);
    }
    // for (var show in popular) {
    //   var img = await TraktAPI().getShowImg(
    //     client: client,
    //     tvdbID: show.show.ids.tvdb.toString()
    //   );
    //   GetIt.instance<DatabaseService>().tVShowsDao.insertTVImgs(img);
    // }
    // for (var show in anticipated) {
    //   var img = await TraktAPI().getShowImg(
    //     client: client,
    //     tvdbID: show.show.ids.tvdb.toString()
    //   );
    //   GetIt.instance<DatabaseService>().tVShowsDao.insertTVImgs(img);
    // }
    return true;
  }
}
