part of 'client_bloc.dart';

@immutable
abstract class ClientState {}

class ClientInitial extends ClientState {}

class ClientReady extends ClientState {
  ClientReady(this.client);
  final Client client;
}

class CodeResponseWaiting extends ClientState {}

class CodeResponseReady extends ClientState {
  CodeResponseReady(this.response);
  final Uri response;
}


