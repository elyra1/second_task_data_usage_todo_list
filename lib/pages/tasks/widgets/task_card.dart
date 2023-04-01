import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/models/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/models/task.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/widgets/app_check_box.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';


class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocProvider(
          create: (context) => TaskBloc(),
          child: AppCheckBox(
            onTap: () => context.read<TaskBloc>().add(UpdateTask(task: task)),
            isCompleted: task.isCompleted,
          ),
        ),
        SizedBox(
          width: 13.w,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: task.isCompleted
                    ? AppTextStyles.titleCompletedStyle
                    : AppTextStyles.titleStyle,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "${task.date} ${task.time}",
                style: task.isCompleted
                    ? AppTextStyles.subtitleCompletedStyle
                    : AppTextStyles.subtitleStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
