part of 'refresh_bloc.dart';

@immutable
abstract class RefreshEvent {}

class Refresh extends RefreshEvent {
  Refresh({this.client});

  final Client client;
}
