import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:second_task_data_usage_todo_list/models/tasks.dart';
part 'db.g.dart';

@DriftDatabase(tables: [Tasks])
class DataBase extends _$DataBase {
  DataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Task>> get allTasks => select(tasks).get();

  Future<int> addTask(TasksCompanion entry) async {
    return await into(tasks).insert(entry);
  }

  Future<bool> updateTask(TasksCompanion entity) async {
    return await update(tasks).replace(entity);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(
        path.join(
          dbFolder.path,
          'db.sqlite',
        ),
      );
      return NativeDatabase.createInBackground(file);
    },
  );
}
