part of 'client_bloc.dart';

@immutable
abstract class ClientEvent {}

class GetClient extends ClientEvent {}

class OnRedirect extends ClientEvent {
  OnRedirect(this.uri);

  final Uri uri;
}