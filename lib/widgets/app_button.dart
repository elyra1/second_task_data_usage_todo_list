import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final String title;
  final double height;
  const AppButton({
    required this.height,
    this.margin,
    required this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(12.r)),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.buttonStyle,
          ),
        ),
      ),
    );
  }
}