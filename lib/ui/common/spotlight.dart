import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/api/classes/show.dart';
import 'package:tracktv/data/db/database.dart';
import 'package:tracktv/data/utils/utility_functions.dart';

class SpotLight extends StatelessWidget {
  const SpotLight({
    Key key,
    @required this.show,
    @required this.client,
    @required this.screenSize,
  }) : super(key: key);

  final Show show;
  final Client client;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
         
          child: FutureBuilder<String>(
            future: GetIt.instance<DatabaseService>().tVShowsDao.getImg(
                type: ImgType.tvposter,
                tvdbID: show.ids.tvdb.toString(),
                client: client),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Image.network(
                  snapshot.data,
                  fit: BoxFit.fitWidth,                
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            stops: [0.1, 0.5, 1.0],
            colors: [
              //Colors.black87,
              Colors.transparent,
              Colors.black87,
              Colors.black
            ],
          )),
          child: Container(
            height: 30,
            width: screenSize.width,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: screenSize.height / 4,
                ),
                FutureBuilder<String>(
                  future: GetIt.instance<DatabaseService>().tVShowsDao.getImg(
                      type: ImgType.hdtvlogo,
                      tvdbID: show.ids.tvdb.toString(),
                      client: client),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Image.network(snapshot.data);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Row()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
