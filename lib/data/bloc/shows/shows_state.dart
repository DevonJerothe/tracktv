part of 'shows_bloc.dart';

@immutable
abstract class ShowsState {}

class ShowsInitial extends ShowsState {}

class RefreshComplete extends ShowsState {}

class NotRefreshed extends ShowsState{}

class ShowListLoaded extends ShowsState{
  ShowListLoaded({this.shows});

  List<ShowLive> shows;
}
