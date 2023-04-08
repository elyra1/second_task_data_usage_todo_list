import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_task_data_usage_todo_list/utils/app_images.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class NoTasksColumn extends StatelessWidget {
  const NoTasksColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          padding: EdgeInsets.only(
            left: 25.w,
          ),
          child: SvgPicture.asset(
            AppImages.curveArrow,
          ),
        ),
      ],
    );
  }
}
