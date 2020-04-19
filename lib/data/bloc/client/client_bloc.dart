import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth2/oauth2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../apikeys.dart';

part 'client_event.dart';
part 'client_state.dart';

// Good morning devon, So i had an idea lasy night in case u forget, fuck....uh...
// Oh yea so just put the DeepLink listener stream in main and call a new ClientEvent form there 
// then you can dispose of it after, Might not work but idk why methods arnt getting called in the listen
// function.


class ClientBloc extends Bloc<ClientEvent, ClientState> {
  @override
  ClientState get initialState => ClientInitial();
  
  AuthorizationCodeGrant grant;

  Directory dir;

  File credentialsFile;

  @override
  Stream<ClientState> mapEventToState(
    ClientEvent event,
  ) async* {
    if (event is GetClient) {
      yield* _mapGetClientToState(event);
    }
    if (event is OnRedirect) {
      yield* _mapOnRedirect(event);
    }
  }

  Stream<ClientState> _mapGetClientToState(GetClient event) async* {
    dir = await getApplicationDocumentsDirectory();
    credentialsFile = new File(dir.path + "/credentials.json");
    var exists = await credentialsFile.exists();
    if (exists) {
      var credentials =
          new Credentials.fromJson(await credentialsFile.readAsString());
      Client client =
          new Client(credentials, identifier: clientID, secret: clientSecret);
      yield ClientReady(client);
      return;
    }

    grant = new AuthorizationCodeGrant(clientID, authEndpoint, tokenEnpoint,
        secret: clientSecret);

    var redirectURL = grant.getAuthorizationUrl(redirectUrl);

    final authURL = "https://trakt.tv/oauth/authorize";
    if (await canLaunch(authURL)) {
      await launch(authURL + "?" + redirectURL.query);
    } else {
      throw "could not launch $authURL";
    }
  }

  Stream<ClientState> _mapOnRedirect(OnRedirect event) async*{
    Client client;
    try {
      client = await grant.handleAuthorizationResponse(event.uri.queryParameters);
    } catch (e) {
      print('error:');
      print(e);
    }
    if (client != null && client.credentials != null){
      await credentialsFile.writeAsString(client.credentials.toJson());
      yield ClientReady(client);
    }
  }

  static Client usrClient(BuildContext context) {
    final state = BlocProvider.of<ClientBloc>(context).state;
    if(state is ClientReady){
      return state.client;
    }else{
      return null;
    }
  }
}
