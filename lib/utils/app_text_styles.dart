import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';

abstract class AppTextStyles {
  static const String fontFamilyOpenSans = "OpenSans";
  static TextStyle headlineStyle = TextStyle(
    color: Colors.black,
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilyOpenSans,
  );

  static TextStyle titleStyle = TextStyle(
    color: AppColors.grey,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
    height: 20.h / 15.sp,
    letterSpacing: -0.24.w,
  );

  static TextStyle titleCompletedStyle = titleStyle.copyWith(
    decoration: TextDecoration.lineThrough,
    color: AppColors.grey.withOpacity(0.3),
  );

  static TextStyle subtitleCompletedStyle = subtitleStyle.copyWith(
    decoration: TextDecoration.lineThrough,
    color: AppColors.grey.withOpacity(0.3),
  );

  static TextStyle buttonStyle = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilyOpenSans,
  );

  static TextStyle subtitleStyle = TextStyle(
    color: AppColors.captionGreyColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
    fontStyle: FontStyle.italic,
    height: 18.h / 13.sp,
    letterSpacing: -0.08.w,
  );

  static TextStyle thinStyle = TextStyle(
    color: Colors.black,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamilyOpenSans,
  );
}
