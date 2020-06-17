import 'package:moor_flutter/moor_flutter.dart';
part 'database.g.dart';

class Tasks extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get note => text().withLength(min: 1)();
  TextColumn get module => text()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();

  /*
  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {id, title};

 */
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase{

  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));
}