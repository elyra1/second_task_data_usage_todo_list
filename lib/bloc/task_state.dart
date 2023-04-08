part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> completedTasks;
  final List<Task> uncompletedTasks;
  final SortType sortType;
  const TaskState({
    this.sortType = SortType.alphabeticalSort,
    this.completedTasks = const <Task>[],
    this.uncompletedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        completedTasks,
        uncompletedTasks,
        sortType,
      ];
}
