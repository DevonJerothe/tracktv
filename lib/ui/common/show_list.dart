import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/api/classes/show.dart';
import 'package:tracktv/data/bloc/client/client_bloc.dart';
import 'package:tracktv/data/db/database.dart';
import 'package:tracktv/data/utils/utility_functions.dart';

class ShowList extends StatelessWidget {
  ShowList({
    this.title,
    this.showList,
  });

  final String title;
  final List<ShowLive> showList;

  @override
  Widget build(BuildContext context) {
    final client = ClientBloc.usrClient(context);
    return Container(
      color: Colors.black,
      //height: 160,
      //margin: EdgeInsets.only(top: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: buildList(client),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildList(Client client) {
    List<Widget> list = [];
    for (var show in showList) {
      list.add(FutureBuilder<String>(
          future: GetIt.instance<DatabaseService>().tVShowsDao.getImg(
              type: ImgType.tvposter,
              tvdbID: show.show.ids.tvdb.toString(),
              client: client),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              if(snapshot.data == 'no image'){
                return Container();
              }
              return Container(
                margin: EdgeInsets.all(5),
                width: 120,
                height: 140,
                child: Image.network(snapshot.data,
                    scale: 8, fit: BoxFit.contain),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }));
    }
    return list;
  }
}
