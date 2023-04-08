import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  const NameTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 241.h,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          errorStyle: AppTextStyles.thinStyle.copyWith(
            fontSize: 10.sp,
            color: Colors.red,
            height: 0.9.h,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter the task name";
          } else {
            return null;
          }
        },
        controller: controller,
      ),
    );
  }
}
