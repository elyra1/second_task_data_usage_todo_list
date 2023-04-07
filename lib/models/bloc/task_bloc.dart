import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:second_task_data_usage_todo_list/data/db.dart';
import 'package:second_task_data_usage_todo_list/models/sort_type.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final db = DataBase();
  TaskBloc() : super(const TaskState()) {
    on<InitialLoad>(_onInitialLoad);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<SortList>(_onSortList);
    on<UpdateSortType>(_onUpdateSortType);
  }

  Future<void> _onInitialLoad(
      InitialLoad event, Emitter<TaskState> emit) async {
    final completedTasks = await (db.allTasks
      ..then(
        (value) => value.where((element) => element.isCompleted == true),
      ));
    final uncompletedTasks = await (db.allTasks
      ..then(
        (value) => value.where((element) => element.isCompleted == false),
      ));

    if (completedTasks.isNotEmpty && uncompletedTasks.isNotEmpty) {
      emit(
        TaskState(
          completedTasks: completedTasks,
          uncompletedTasks: uncompletedTasks,
        ),
      );
    }
  }

  Future<void> _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    final state = this.state;
    final task = event.task;
    emit(
      TaskState(
        completedTasks: state.completedTasks,
        uncompletedTasks: List.from(state.uncompletedTasks)..add(task),
        sortType: state.sortType,
      ),
    );
    db.addTask(
      TasksCompanion(
        title: Value(task.title),
        time: Value(task.time),
        date: Value(task.date),
        isCompleted: Value(task.isCompleted),
      ),
    );
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    final state = this.state;
    final task = event.task;
    if (task.isCompleted) {
      emit(
        TaskState(
          completedTasks: List.from(state.completedTasks)..remove(task),
          uncompletedTasks: List.from(state.uncompletedTasks)
            ..add(
              task.copyWith(isCompleted: false),
            ),
          sortType: state.sortType,
        ),
      );
    } else {
      emit(
        TaskState(
          completedTasks: List.from(state.completedTasks)
            ..add(
              task.copyWith(
                isCompleted: !task.isCompleted,
              ),
            ),
          uncompletedTasks: List.from(state.uncompletedTasks)..remove(task),
          sortType: state.sortType,
        ),
      );
    }
    db.updateTask(
      TasksCompanion(
        title: Value(task.title),
        time: Value(task.time),
        date: Value(task.date),
        isCompleted: Value(!task.isCompleted),
      ),
    );
  }

  void _onSortList(SortList event, Emitter<TaskState> emit) {
    final state = this.state;
    final SortType sortType = state.sortType;
    List<Task> completedTasks = List.from(state.completedTasks);
    List<Task> uncompletedTasks = List.from(state.uncompletedTasks);

    if (sortType.type == SortType.alphabeticalSort.type) {
      completedTasks.sort(
        (a, b) => a.title.toLowerCase().compareTo(
              b.title.toLowerCase(),
            ),
      );
      uncompletedTasks.sort(
        (a, b) => a.title.toLowerCase().compareTo(
              b.title.toLowerCase(),
            ),
      );
      emit(
        TaskState(
          completedTasks: List.from(completedTasks),
          uncompletedTasks: List.from(uncompletedTasks),
          sortType: state.sortType,
        ),
      );
    } else if (sortType.type == SortType.alphabeticalSortReversed.type) {
      completedTasks.sort(
        (b, a) => a.title.toLowerCase().compareTo(
              b.title.toLowerCase(),
            ),
      );
      uncompletedTasks.sort(
        (b, a) => a.title.toLowerCase().compareTo(
              b.title.toLowerCase(),
            ),
      );

      emit(
        TaskState(
          completedTasks: completedTasks.toList(),
          uncompletedTasks: uncompletedTasks.toList(),
          sortType: state.sortType,
        ),
      );
    } else {
      DateFormat format = DateFormat('dd.MM.yyyy hh:mm');
      completedTasks.sort(
        (b, a) => (format
            .parse(
              "${a.date} ${a.time}",
            )
            .compareTo(
              format.parse(
                "${b.date} ${b.time}",
              ),
            )),
      );
      uncompletedTasks.sort(
        (b, a) => (format
            .parse(
              "${a.date} ${a.time}",
            )
            .compareTo(
              format.parse(
                "${b.date} ${b.time}",
              ),
            )),
      );

      emit(
        TaskState(
          completedTasks: completedTasks.toList(),
          uncompletedTasks: uncompletedTasks.toList(),
          sortType: state.sortType,
        ),
      );
    }
  }

  void _onUpdateSortType(UpdateSortType event, Emitter<TaskState> emit) {
    emit(
      TaskState(
        completedTasks: List.from(state.completedTasks),
        uncompletedTasks: List.from(state.uncompletedTasks),
        sortType: event.sortType,
      ),
    );
  }
}
