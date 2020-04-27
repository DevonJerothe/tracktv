import 'package:enum_to_string/enum_to_string.dart';
import 'package:moor/moor.dart';
import 'package:oauth2/oauth2.dart';
import 'package:tracktv/data/api/classes/show.dart';
import 'package:tracktv/data/api/classes/tv_imgs.dart';
import 'package:tracktv/data/api/trakt_api.dart';
import 'package:tracktv/data/db/database.dart';
import 'package:tracktv/data/db/tables/tv_imgs.dart';
import 'package:tracktv/data/utils/utility_functions.dart';

part 'tv_shows.g.dart';


@UseDao(tables: [TVimgRecords], 
queries: {
  'imgsByType':
    'SELECT * FROM TVimg WHERE tv_d_b = :tvDB AND type = :typeString',
})
class TVShowsDao extends DatabaseAccessor<DatabaseService>
    with _$TVShowsDaoMixin {
  TVShowsDao(DatabaseService db) : super(db);

  Future insertTVImgs(TVimgs imgs) async {
    final _updated = DateTime.now();
    final _items = <TVimgRecordsCompanion>[];

    for (var img in imgs.hdtvlogo) {
      final _item = TVimgRecordsCompanion(
          tvDB: addField<String>(imgs.thetvdbId),
          id: addField<String>(img.id),
          url: addField<String>(img.url),
          type: addField<String>('hdtvlogo'),
          likes: addField<int>(int.parse(img.likes)));
      _items.add(_item);
    }
    for (var img in imgs.tvposter) {
      final _item = TVimgRecordsCompanion(
          tvDB: addField<String>(imgs.thetvdbId),
          id: addField<String>(img.id),
          url: addField<String>(img.url),
          type: addField<String>('tvposter'),
          likes: addField<int>(int.parse(img.likes)));
      _items.add(_item);
    }

    return batch((b) {
      b.insertAll(tVimgRecords, _items, mode: InsertMode.insertOrReplace);
    });  
  }

  //edit to return a list of desired # of types
  
}
