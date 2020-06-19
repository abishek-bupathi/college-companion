import 'package:moor_flutter/moor_flutter.dart';
part 'database.g.dart';

class Tasks extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get note => text().withDefault(Constant(""))();
  TextColumn get module => text()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();

}

class Activity extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get note => text().withDefault(Constant(""))();
  TextColumn get location => text().withDefault(Constant(""))();
  DateTimeColumn get date => dateTime().nullable()();
  DateTimeColumn get time => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();

}


@UseMoor(tables: [Tasks, Activity])
class AppDatabase extends _$AppDatabase{

  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Task>> watchAllTask() => select(tasks).watch();
  Future insertTask(Task task) => into(tasks).insert(task);
  Future updateTask(Task task) => update(tasks).replace(task);
  Future deleteTask(Task task) => delete(tasks).delete(task);

  Future<List<ActivityData>> getAllActivities() => select(activity).get();
  Stream<List<ActivityData>> watchAllActivities() => select(activity).watch();
  Future insertActivity(ActivityData activity_item) => into(activity).insert(activity_item);
  Future updateActivity(ActivityData activity_item) => update(activity).replace(activity_item);
  Future deleteActivity(ActivityData activity_item) => delete(activity).delete(activity_item);


}