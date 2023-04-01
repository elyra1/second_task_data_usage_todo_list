import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_task_data_usage_todo_list/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        tasks: List.from(state.tasks)..add(event.task),
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    emit(
      TaskState(
        tasks: List.from(state.tasks)..remove(task)..add(task.copyWith(isCompleted: task.isCompleted ? false : true))
      ),
    );
  }
}
