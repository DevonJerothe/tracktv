import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/api/classes/show.dart';
import 'package:tracktv/data/api/trakt_api.dart';
import 'package:tracktv/data/bloc/client/client_bloc.dart';
import 'package:tracktv/data/bloc/shows/shows_bloc.dart';
import 'package:tracktv/data/db/database.dart';
import 'package:tracktv/data/utils/utility_functions.dart';
import 'package:tracktv/ui/common/spotlight.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final trakt = new TraktAPI();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ShowsBloc>(context).add(GetShowList(
        type: ListCategory.trending,
        limit: 5,
        extended: true,
        context: context));
  }

  void init(Client client) async {
    await trakt.syncLastActivity(client: client);
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final Size screenSize = MediaQuery.of(context).size;
    final client = ClientBloc.usrClient(context);
    return BlocBuilder<ShowsBloc, ShowsState>(
      builder: (context, state) {
        if (state is ShowListLoaded) {
          final shows = state.shows;
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                primary: true,
                floating: true,
                expandedHeight: screenSize.height * 0.65,
                backgroundColor: Colors.black,
                titleSpacing: 20,
                title: Title(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Text('TV')),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Text('Movies'),
                      )
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(              
                    child: CarouselSlider.builder(
                        itemCount: shows.length,
                        itemBuilder: (context, index) {
                          return SpotLight(
                            show: shows[index],
                            client: client,
                            screenSize: screenSize,
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          height: MediaQuery.of(context).size.height,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(seconds: 2),
                          autoPlayInterval: Duration(seconds: 8)
                        )),
                       
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}



