import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_task_data_usage_todo_list/models/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/models/task.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';
import 'package:second_task_data_usage_todo_list/utils/app_icons.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';
import 'package:second_task_data_usage_todo_list/widgets/app_button.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final timeController = TextEditingController();

    Future displayTimePicker(BuildContext context) async {
  var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now());

  if (time != null) {
    setState(() {
      timeController.text = "${time.hour}:${time.minute}";
    });
  }
}

    return BlocProvider(
      create: (context) => TaskBloc(),
      child: FractionallySizedBox(
        heightFactor: 0.92,
        child: Scaffold(
          appBar: AppBar(
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
            leadingWidth: 65.w,
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
                    )
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 37.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add a task",
                    style: AppTextStyles.headlineStyle,
                  ),
                  SizedBox(
                    height: 43.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Name",
                        style: AppTextStyles.buttonStyle
                            .copyWith(fontSize: 20.sp, color: Colors.black),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      SizedBox(
                          width: 241.h,
                          height: 26.h,
                          child: TextField(
                            controller: nameController,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Time",
                        style: AppTextStyles.buttonStyle
                            .copyWith(fontSize: 20.sp, color: Colors.black),
                      ),
                      SizedBox(
                        width: 22.w,
                      ),
                      Container(
                        width: 86.w,
                        height: 36.h,
                        color: AppColors.fieldColor,
                        child: TextField(controller: timeController,readOnly: true,onTap: () => displayTimePicker(context),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Date",
                        style: AppTextStyles.buttonStyle
                            .copyWith(fontSize: 20.sp, color: Colors.black),
                      ),
                      SizedBox(
                        width: 22.w,
                      ),
                      Container(
                        width: 163.w,
                        height: 36.h,
                        color: AppColors.fieldColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 57.h,
                  ),
                  AppButton(
                    height: 46.h,
                    title: "Done",
                    onTap: () {
                      context.read<TaskBloc>().add(
                            AddTask(
                              task: Task(
                                title: nameController.text,
                                time: timeController.text,
                                date: "2023",
                              ),
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
