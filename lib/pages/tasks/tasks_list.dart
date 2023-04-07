import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/data/db.dart';
import 'package:second_task_data_usage_todo_list/models/sort_type.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/widgets/task_card.dart';

class TasksList extends StatelessWidget {
  final List<Task> completedTasks;
  final List<Task> uncompletedTasks;
  final bool isCompletedHidden;
  final SortType sortType;
  const TasksList(
      {super.key,
      required this.completedTasks,
      required this.uncompletedTasks,
      required this.isCompletedHidden,
      required this.sortType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < uncompletedTasks.length; i++) ...[
          TaskCard(
            task: uncompletedTasks[i],
            sortType: sortType,
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
        if (!isCompletedHidden)
          for (int i = 0; i < completedTasks.length; i++) ...[
            TaskCard(
              task: completedTasks[i],
              sortType: sortType,
            ),
            SizedBox(
              height: 12.h,
            ),
          ]
      ],
    );
  }
}
