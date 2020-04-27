// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_shows.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TVShowsDaoMixin on DatabaseAccessor<DatabaseService> {
  $TVimgRecordsTable get tVimgRecords => db.tVimgRecords;
  TVimg _rowToTVimg(QueryRow row) {
    return TVimg(
      imdbPoster: row.readString('imdb_poster'),
      tvDB: row.readString('tv_d_b'),
      type: row.readString('type'),
      id: row.readString('id'),
      url: row.readString('url'),
      lang: row.readString('lang'),
      likes: row.readInt('likes'),
    );
  }

  Selectable<TVimg> imgsByTypeQuery(String tvDB, String typeString) {
    return customSelectQuery(
        'SELECT * FROM TVimg WHERE tv_d_b = :tvDB AND type = :typeString',
        variables: [Variable.withString(tvDB), Variable.withString(typeString)],
        readsFrom: {tVimgRecords}).map(_rowToTVimg);
  }

  Future<List<TVimg>> imgsByType(String tvDB, String typeString) {
    return imgsByTypeQuery(tvDB, typeString).get();
  }

  Stream<List<TVimg>> watchImgsByType(String tvDB, String typeString) {
    return imgsByTypeQuery(tvDB, typeString).watch();
  }
}
