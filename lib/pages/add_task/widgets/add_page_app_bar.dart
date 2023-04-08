import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';
import 'package:second_task_data_usage_todo_list/utils/app_icons.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class AddPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      shadowColor: Colors.black.withOpacity(0.3),
      centerTitle: true,
      title: Text(
        "Task",
        style: AppTextStyles.titleStyle.copyWith(
          color: Colors.black,
          fontSize: 17.sp,
        ),
      ),
      leadingWidth: 69.w,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          padding: EdgeInsets.only(left: 9.w),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.chevronLeftIcon,
                width: 12.r,
                height: 21.r,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Close",
                style: AppTextStyles.thinStyle.copyWith(
                  color: AppColors.blueButtonColor,
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
