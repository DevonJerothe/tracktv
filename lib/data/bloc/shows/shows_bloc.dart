import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tracktv/data/api/classes/show.dart';
import 'package:tracktv/data/api/trakt_api.dart';
import 'package:tracktv/data/bloc/client/client_bloc.dart';
import 'package:tracktv/data/utils/utility_functions.dart';

part 'shows_event.dart';
part 'shows_state.dart';

class ShowsBloc extends Bloc<ShowsEvent, ShowsState> {
  @override
  ShowsState get initialState => ShowsInitial();

  @override
  Stream<ShowsState> mapEventToState(
    ShowsEvent event,
  ) async* {
    if (event is GetShowList){
      final client = ClientBloc.usrClient(event.context);
      var shows = await TraktAPI().getShows(
        type: event.type,
        client: client,
        extended: true
      );
      yield ShowListLoaded(shows: shows);
    } 
  }
}
