part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class InitialLoad extends TaskEvent {
  const InitialLoad();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateSortType extends TaskEvent {
  final SortType sortType;
  const UpdateSortType({required this.sortType});

  @override
  List<Object> get props => [sortType];
}

class SortList extends TaskEvent {
  final SortType sortType;
  const SortList({required this.sortType});

  @override
  List<Object> get props => [sortType];
}
