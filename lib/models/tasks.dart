import 'package:drift/drift.dart';

class Tasks extends Table {
  TextColumn get title => text().named('title')();
  TextColumn get time => text().named('time')();
  TextColumn get date => text().named('date')();
  BoolColumn get isCompleted => boolean()();
}
