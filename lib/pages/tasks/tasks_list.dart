import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_task_data_usage_todo_list/data/db.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/widgets/task_card.dart';
import 'package:second_task_data_usage_todo_list/utils/app_images.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class TasksList extends StatelessWidget {
  final List<Task> completedTasks;
  final List<Task> uncompletedTasks;
  final bool isCompletedHidden;
  const TasksList({
    super.key,
    required this.completedTasks,
    required this.uncompletedTasks,
    required this.isCompletedHidden,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isCompletedHidden && uncompletedTasks.isEmpty) ...[
          SizedBox(
            width: 153.w,
            height: 100.h,
            child: Flexible(
              child: Text(
                'Looks like there is no tasks yet! Go ahead and push a plus button below',
                style: AppTextStyles.titleStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: SvgPicture.asset(
              AppImages.curveArrow,
            ),
          ),
        ] else ...[
          for (int i = 0; i < uncompletedTasks.length; i++) ...[
            TaskCard(
              task: uncompletedTasks[i],
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
          if (!isCompletedHidden)
            for (int i = 0; i < completedTasks.length; i++) ...[
              TaskCard(
                task: completedTasks[i],
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
        ],
      ],
    );
  }
}
