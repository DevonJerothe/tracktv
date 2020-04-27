part of 'refresh_bloc.dart';

@immutable
abstract class RefreshState {}

class RefreshInitial extends RefreshState {}

class Refreshed extends RefreshState{
  Refreshed({
    this.tTrend,
    this.tPop,
    this.tAnt,
  });

  final List<ShowLive> tTrend;
  final List<ShowLive> tPop;
  final List<ShowLive> tAnt;
}