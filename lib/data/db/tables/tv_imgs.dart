import 'package:moor/moor.dart';

@DataClassName('TVimg')
class TVimgRecords extends Table {
  @override 
  String get tableName => 'TVimg';

  @override 
  Set<Column> get primaryKey => {id};

  TextColumn get tvDB => text()();

  TextColumn get type => text()();

  TextColumn get id => text()();

  TextColumn get url => text().nullable()();

  TextColumn get lang => text().nullable()();

  IntColumn get likes => integer().nullable()();
}