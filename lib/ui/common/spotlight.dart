import 'package:enum_to_string/enum_to_string.dart';
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

  final ShowLive show;
  final Client client;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Image.network("http://img.omdbapi.com/?apikey=${key}&i=${show.show.ids.imdb}"),
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
                StreamBuilder<List<TVimg>>(
                  stream: GetIt.instance<DatabaseService>()
                      .tVShowsDao
                      .watchImgsByType(show.show.ids.tvdb.toString(),
                          EnumToString.parse(ImgType.hdtvlogo)),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data[0].url != null) {
                      return Image.network(snapshot.data.first.url);
                    }
                    return Container();
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
