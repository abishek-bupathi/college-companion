// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final String note;
  final String module;
  final DateTime dueDate;
  final bool completed;
  Task(
      {@required this.id,
      @required this.title,
      @required this.note,
      @required this.module,
      this.dueDate,
      @required this.completed});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      module:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}module']),
      dueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || module != null) {
      map['module'] = Variable<String>(module);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      module:
          module == null && nullToAbsent ? const Value.absent() : Value(module),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String>(json['note']),
      module: serializer.fromJson<String>(json['module']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String>(note),
      'module': serializer.toJson<String>(module),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  Task copyWith(
          {int id,
          String title,
          String note,
          String module,
          DateTime dueDate,
          bool completed}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        module: module ?? this.module,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('module: $module, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              note.hashCode,
              $mrjc(module.hashCode,
                  $mrjc(dueDate.hashCode, completed.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.module == this.module &&
          other.dueDate == this.dueDate &&
          other.completed == this.completed);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> note;
  final Value<String> module;
  final Value<DateTime> dueDate;
  final Value<bool> completed;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.module = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.note = const Value.absent(),
    @required String module,
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
  })  : title = Value(title),
        module = Value(module);
  static Insertable<Task> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> note,
    Expression<String> module,
    Expression<DateTime> dueDate,
    Expression<bool> completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (module != null) 'module': module,
      if (dueDate != null) 'due_date': dueDate,
      if (completed != null) 'completed': completed,
    });
  }

  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> note,
      Value<String> module,
      Value<DateTime> dueDate,
      Value<bool> completed}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      module: module ?? this.module,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (module.present) {
      map['module'] = Variable<String>(module.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, false,
        defaultValue: Constant(""));
  }

  final VerificationMeta _moduleMeta = const VerificationMeta('module');
  GeneratedTextColumn _module;
  @override
  GeneratedTextColumn get module => _module ??= _constructModule();
  GeneratedTextColumn _constructModule() {
    return GeneratedTextColumn(
      'module',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  GeneratedDateTimeColumn _dueDate;
  @override
  GeneratedDateTimeColumn get dueDate => _dueDate ??= _constructDueDate();
  GeneratedDateTimeColumn _constructDueDate() {
    return GeneratedDateTimeColumn(
      'due_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, note, module, dueDate, completed];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('module')) {
      context.handle(_moduleMeta,
          module.isAcceptableOrUnknown(data['module'], _moduleMeta));
    } else if (isInserting) {
      context.missing(_moduleMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date'], _dueDateMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed'], _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

class ActivityData extends DataClass implements Insertable<ActivityData> {
  final int id;
  final String title;
  final String note;
  final String location;
  final DateTime date;
  final DateTime time;
  final bool completed;
  ActivityData(
      {@required this.id,
      @required this.title,
      @required this.note,
      @required this.location,
      this.date,
      this.time,
      @required this.completed});
  factory ActivityData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ActivityData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      time:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    return map;
  }

  ActivityCompanion toCompanion(bool nullToAbsent) {
    return ActivityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
    );
  }

  factory ActivityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ActivityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String>(json['note']),
      location: serializer.fromJson<String>(json['location']),
      date: serializer.fromJson<DateTime>(json['date']),
      time: serializer.fromJson<DateTime>(json['time']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String>(note),
      'location': serializer.toJson<String>(location),
      'date': serializer.toJson<DateTime>(date),
      'time': serializer.toJson<DateTime>(time),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  ActivityData copyWith(
          {int id,
          String title,
          String note,
          String location,
          DateTime date,
          DateTime time,
          bool completed}) =>
      ActivityData(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        location: location ?? this.location,
        date: date ?? this.date,
        time: time ?? this.time,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('ActivityData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('location: $location, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              note.hashCode,
              $mrjc(
                  location.hashCode,
                  $mrjc(date.hashCode,
                      $mrjc(time.hashCode, completed.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ActivityData &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.location == this.location &&
          other.date == this.date &&
          other.time == this.time &&
          other.completed == this.completed);
}

class ActivityCompanion extends UpdateCompanion<ActivityData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> note;
  final Value<String> location;
  final Value<DateTime> date;
  final Value<DateTime> time;
  final Value<bool> completed;
  const ActivityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.location = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.completed = const Value.absent(),
  });
  ActivityCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.note = const Value.absent(),
    this.location = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.completed = const Value.absent(),
  }) : title = Value(title);
  static Insertable<ActivityData> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> note,
    Expression<String> location,
    Expression<DateTime> date,
    Expression<DateTime> time,
    Expression<bool> completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (location != null) 'location': location,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (completed != null) 'completed': completed,
    });
  }

  ActivityCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> note,
      Value<String> location,
      Value<DateTime> date,
      Value<DateTime> time,
      Value<bool> completed}) {
    return ActivityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      location: location ?? this.location,
      date: date ?? this.date,
      time: time ?? this.time,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }
}

class $ActivityTable extends Activity
    with TableInfo<$ActivityTable, ActivityData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ActivityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, false,
        defaultValue: Constant(""));
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn('location', $tableName, false,
        defaultValue: Constant(""));
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedDateTimeColumn _time;
  @override
  GeneratedDateTimeColumn get time => _time ??= _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, note, location, date, time, completed];
  @override
  $ActivityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'activity';
  @override
  final String actualTableName = 'activity';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time'], _timeMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed'], _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ActivityData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ActivityTable createAlias(String alias) {
    return $ActivityTable(_db, alias);
  }
}

class Test extends DataClass implements Insertable<Test> {
  final int id;
  final String location;
  final String module;
  final DateTime date;
  final DateTime time;
  Test(
      {@required this.id,
      @required this.location,
      @required this.module,
      this.date,
      this.time});
  factory Test.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Test(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      module:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}module']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      time:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || module != null) {
      map['module'] = Variable<String>(module);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    return map;
  }

  TestsCompanion toCompanion(bool nullToAbsent) {
    return TestsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      module:
          module == null && nullToAbsent ? const Value.absent() : Value(module),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
    );
  }

  factory Test.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Test(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      module: serializer.fromJson<String>(json['module']),
      date: serializer.fromJson<DateTime>(json['date']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'module': serializer.toJson<String>(module),
      'date': serializer.toJson<DateTime>(date),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  Test copyWith(
          {int id,
          String location,
          String module,
          DateTime date,
          DateTime time}) =>
      Test(
        id: id ?? this.id,
        location: location ?? this.location,
        module: module ?? this.module,
        date: date ?? this.date,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('Test(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('module: $module, ')
          ..write('date: $date, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(location.hashCode,
          $mrjc(module.hashCode, $mrjc(date.hashCode, time.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Test &&
          other.id == this.id &&
          other.location == this.location &&
          other.module == this.module &&
          other.date == this.date &&
          other.time == this.time);
}

class TestsCompanion extends UpdateCompanion<Test> {
  final Value<int> id;
  final Value<String> location;
  final Value<String> module;
  final Value<DateTime> date;
  final Value<DateTime> time;
  const TestsCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.module = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
  });
  TestsCompanion.insert({
    this.id = const Value.absent(),
    @required String location,
    @required String module,
    this.date = const Value.absent(),
    this.time = const Value.absent(),
  })  : location = Value(location),
        module = Value(module);
  static Insertable<Test> custom({
    Expression<int> id,
    Expression<String> location,
    Expression<String> module,
    Expression<DateTime> date,
    Expression<DateTime> time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (module != null) 'module': module,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
    });
  }

  TestsCompanion copyWith(
      {Value<int> id,
      Value<String> location,
      Value<String> module,
      Value<DateTime> date,
      Value<DateTime> time}) {
    return TestsCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      module: module ?? this.module,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (module.present) {
      map['module'] = Variable<String>(module.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }
}

class $TestsTable extends Tests with TableInfo<$TestsTable, Test> {
  final GeneratedDatabase _db;
  final String _alias;
  $TestsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      false,
    );
  }

  final VerificationMeta _moduleMeta = const VerificationMeta('module');
  GeneratedTextColumn _module;
  @override
  GeneratedTextColumn get module => _module ??= _constructModule();
  GeneratedTextColumn _constructModule() {
    return GeneratedTextColumn(
      'module',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedDateTimeColumn _time;
  @override
  GeneratedDateTimeColumn get time => _time ??= _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, location, module, date, time];
  @override
  $TestsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tests';
  @override
  final String actualTableName = 'tests';
  @override
  VerificationContext validateIntegrity(Insertable<Test> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('module')) {
      context.handle(_moduleMeta,
          module.isAcceptableOrUnknown(data['module'], _moduleMeta));
    } else if (isInserting) {
      context.missing(_moduleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time'], _timeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Test map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Test.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TestsTable createAlias(String alias) {
    return $TestsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  $ActivityTable _activity;
  $ActivityTable get activity => _activity ??= $ActivityTable(this);
  $TestsTable _tests;
  $TestsTable get tests => _tests ??= $TestsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks, activity, tests];
}
