import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  int currentIndex = 0;
  final tabs = [MyMovies(), MyTv()];

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentIndex,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              child: Center(
                child: TabBar(
                  onTap: (val) => currentIndex = val,
                  tabs: <Widget>[
                    Tab(child: Text("My Tv"),),
                    Tab(child: Text("My Movies"),)
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(-5)),
        ),
      ),
    );
  }
}

class MyMovies extends StatefulWidget {
  @override
  _MyMoviesState createState() => _MyMoviesState();
}

class _MyMoviesState extends State<MyMovies> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyTv extends StatefulWidget {
  @override
  _MyTvState createState() => _MyTvState();
}

class _MyTvState extends State<MyTv> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
