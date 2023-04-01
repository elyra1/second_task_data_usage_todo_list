import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.freezed.dart';

@freezed
class Task with _$Task{
  const factory Task({
    required String title,
    required String time,
    required String date,
    @Default(false) bool isCompleted,
  }) = _Task;
}