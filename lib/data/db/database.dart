import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:tracktv/data/db/dao/tv_shows.dart';
import 'package:tracktv/data/db/tables/tv_imgs.dart';

import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;

part 'database.g.dart';

@UseMoor(
  tables: [
    TVimgRecords
  ],
  daos: [
    TVShowsDao,
  ],
  queries: {}
)
class DatabaseService extends _$DatabaseService {
  DatabaseService(QueryExecutor e) : super(e);

  @override 
  int get schemaVersion => 1;
}

Value<T> addField<T>(T val, {T fallback}) {
  Value<T> _fallback;
  if (fallback != null) {
    _fallback = Value<T>(fallback);
  }
  if (val == null) {
    return _fallback ?? Value.absent();
  }
  if (val is String && (val == 'null' || val == 'Null')) {
    return _fallback ?? Value.absent();
  }
  return Value(val);
}

DatabaseService constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return DatabaseService(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    return DatabaseService(VmDatabase(file, logStatements: logStatements));
  }
  // if (Platform.isWindows) {
  //   final file = File('db.sqlite');
  //   return Database(VMDatabase(file, logStatements: logStatements));
  // }
  return DatabaseService(VmDatabase.memory(logStatements: logStatements));
}

