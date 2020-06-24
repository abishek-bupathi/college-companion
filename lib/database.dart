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

class Tests extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get location => text()();
  TextColumn get module => text()();
  DateTimeColumn get date => dateTime().nullable()();
  DateTimeColumn get time => dateTime().nullable()();
}

class Period extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get day => integer()();
  TextColumn get module => text()();
  TextColumn get location => text()();
  TextColumn get lecturer => text()();
  DateTimeColumn get time => dateTime().nullable()();
}

@UseMoor(tables: [Tasks, Activity, Tests, Period])
class AppDatabase extends _$AppDatabase{

  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Task>> watchTaskOnDate(DateTime date){
    return(select(tasks)
      ..where((tbl) => tbl.dueDate.equals(date))
    ).watch();
  }
  Stream<List<Task>> watchAllTask() => select(tasks).watch();
  Future insertTask(Task task) => into(tasks).insert(task);
  Future updateTask(Task task) => update(tasks).replace(task);
  Future deleteTask(Task task) => delete(tasks).delete(task);

  Future<List<ActivityData>> getAllActivities() => select(activity).get();
  Stream<List<ActivityData>> watchActivityOnDate(DateTime date){
    return(select(activity)
      ..where((tbl) => tbl.date.equals(date))
    ).watch();
  }
  Stream<List<ActivityData>> watchAllActivities() => select(activity).watch();
  Future insertActivity(ActivityData activity_item) => into(activity).insert(activity_item);
  Future updateActivity(ActivityData activity_item) => update(activity).replace(activity_item);
  Future deleteActivity(ActivityData activity_item) => delete(activity).delete(activity_item);

  Future<List<Test>> getAllTests() => select(tests).get();
  Future<List<Test>> watchTestOnDate(DateTime date){
    return(select(tests)
      ..where((tbl) => tbl.date.equals(date))
    ).get();
  }
  Stream<List<Test>> watchAllTests() => select(tests).watch();
  Future insertTest(Test test) => into(tests).insert(test);
  Future updateTest(Test test) => update(tests).replace(test);
  Future deleteTest(Test test) => delete(tests).delete(test);

  Future<List<PeriodData>> getAllPeriods() => select(period).get();
  Stream<List<PeriodData>> watchTodayPeriod(int dayNo){
    return(select(period)
           ..where((tbl) => tbl.day.equals(dayNo))
    ).watch();
  }
  Stream<List<PeriodData>> watchAllPeriods() => select(period).watch();
  Future insertPeriod(PeriodData periodData) => into(period).insert(periodData);
  Future updatePeriod(PeriodData periodData) => update(period).replace(periodData);
  Future deletePeriod(PeriodData periodData) => delete(period).delete(periodData);

}
