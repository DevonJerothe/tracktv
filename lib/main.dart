import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tracktv/data/bloc/client/client_bloc.dart';
import 'package:tracktv/data/bloc/refresh/refresh_bloc.dart';
import 'package:tracktv/data/bloc/shows/shows_bloc.dart';
import 'package:uni_links/uni_links.dart';

import 'data/db/database.dart';
import 'ui/account.dart';
import 'ui/home.dart';

GetIt getIt = GetIt.instance; 

void main() {
  getIt.registerSingleton<DatabaseService>(constructDb());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClientBloc>(create: (_) => ClientBloc()),
        BlocProvider<ShowsBloc>(create: (_) => ShowsBloc()),
        BlocProvider<RefreshBloc>(create: (_) => RefreshBloc())
      ],
      child: MaterialApp(
        title: 'MyUsher',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription _sub;
  int currentIndex = 0;

  @override
  Future<void> initState() {
    super.initState();
    init();
  }

  void init() async {
    //BlocProvider.of<ClientBloc>(context).add(GetClient());
    await initDeepLink();
    _sub = getUriLinksStream().listen((Uri uri) async {
      print('Redirect url: ${uri.toString()}');
      BlocProvider.of<ClientBloc>(context).add(OnRedirect(uri));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [Home(), AccountScreen()];
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state is ClientReady) {
          return Scaffold(
            
            body: IndexedStack(
              index: currentIndex,
              children: tabs
            )
          );
        } else {
          return Scaffold(
            body: Container(
              child: Center(
                child: FlatButton.icon(
                  onPressed: () {
                    BlocProvider.of<ClientBloc>(context).add(GetClient());
                  },
                  icon: FaIcon(FontAwesomeIcons.signInAlt),
                  label: Text('Authorize with Trakt.tv'),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<Null> initDeepLink() async {
    try {
      Uri initLink = await getInitialUri();
      print(initLink);
      //onRedirect(initLink);
    } on PlatformException {
      throw "platform error fuck";
    }
  }
}
