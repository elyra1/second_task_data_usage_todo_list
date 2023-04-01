import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool isCompleted;
  const AppCheckBox({
    super.key,
    this.onTap,
    required this.isCompleted,
  });
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20.r,
        width: 20.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: isCompleted? Colors.black:Colors.white,
          border: Border.all(
            color: isCompleted? Colors.black:AppColors.borderColor,
            width: 2.sp,
          ),
        
        ),
        child: isCompleted ? Center(child: Icon(Icons.check, color: Colors.white,size: 16.r,)) : null,
      ),
    );
  }
}
