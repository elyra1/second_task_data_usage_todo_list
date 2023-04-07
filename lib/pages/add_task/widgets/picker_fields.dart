import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class DatePickerField extends StatelessWidget {
  final VoidCallback onTap;
  const DatePickerField({
    super.key,
    required this.date,
    required this.onTap,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 163.w,
        height: 36.h,
        color: AppColors.fieldColor,
        child: Center(
          child: Text(
            DateFormat('dd.MM.yyyy').format(date),
            style: AppTextStyles.thinStyle,
          ),
        ),
      ),
    );
  }
}

class TimePickerField extends StatelessWidget {
  final VoidCallback onTap;
  const TimePickerField({
    super.key,
    required this.time,
    required this.onTap,
  });

  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 86.w,
        height: 36.h,
        color: AppColors.fieldColor,
        child: Center(
          child: Text(
            time.format(context),
            style: AppTextStyles.thinStyle,
          ),
        ),
      ),
    );
  }
}
