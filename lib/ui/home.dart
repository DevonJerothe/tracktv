import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/api/classes/show.dart';
import 'package:tracktv/data/api/trakt_api.dart';
import 'package:tracktv/data/bloc/client/client_bloc.dart';
import 'package:tracktv/data/bloc/refresh/refresh_bloc.dart';
import 'package:tracktv/data/db/database.dart';
import 'package:tracktv/data/utils/utility_functions.dart';
import 'package:tracktv/ui/common/spotlight.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  Client client;

  final trakt = new TraktAPI();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = ClientBloc.usrClient(context);
    BlocProvider.of<RefreshBloc>(context).add(Refresh(client: client));
  }

  void init(Client client) async {
    var response = await client.get('https://img.omdbapi.com/?apikey=c3a93533&i=tt0903747');
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final Size screenSize = MediaQuery.of(context).size;
    final client = ClientBloc.usrClient(context);
    return BlocBuilder<RefreshBloc, RefreshState>(
      builder: (context, state) {
        if (state is Refreshed) {
          final trendingTv = state.tTrend;
          final popularTv = state.tPop;
          final anticipatedTV = state.tAnt;
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
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return SpotLight(
                            show: trendingTv[index],
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
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    
                  ]
                ),
              )
            ],
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}



