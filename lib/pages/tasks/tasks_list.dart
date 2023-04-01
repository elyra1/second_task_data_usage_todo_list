import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/models/task.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/widgets/task_card.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < tasks.length; i++)...[
          TaskCard(task: tasks[i]),
          SizedBox(height: 12.h,),
        ]
      ],
    );
  }
}
