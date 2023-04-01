import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_task_data_usage_todo_list/models/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/pages/add_task/add_page.dart';
import 'package:second_task_data_usage_todo_list/pages/info/info_page.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/tasks_list.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';
import 'package:second_task_data_usage_todo_list/utils/app_icons.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.backgroundColor,
                  shadowColor: Colors.transparent,
                  toolbarHeight: 84.h,
                  floating: true,
                  title: Padding(
                    padding: EdgeInsets.only(
                      top: 23.h,
                      left: 11.w,
                      right: 0.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My tasks",
                          style: AppTextStyles.headlineStyle,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Hide completed",
                            style: AppTextStyles.buttonStyle.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.blueButtonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 25.h,
                          left: 27.w,
                          right: 14.w,
                        ),
                        child: TasksList(tasks: state.tasks),
                      ),
                    );
                  },
                ),
              ],
            ),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 5.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const InfoPage(),
                      ),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.infoIcon,
                      width: 58.r,
                      height: 58.r,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.r),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const AddPage(),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.addIcon,
                      width: 58.r,
                      height: 58.r,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "alphabeticalSorting",
            icon: SvgPicture.asset(
              AppIcons.alphabeticalSortingIcon,
              width: 40.r,
              height: 40.r,
            ),
          ),
          BottomNavigationBarItem(
            label: "alphabeticalSortingTwo",
            icon: SvgPicture.asset(
              AppIcons.alphabeticalSortingTwoIcon,
              width: 40.r,
              height: 40.r,
            ),
          ),
          BottomNavigationBarItem(
            label: "ascendingDownSorting",
            icon: SvgPicture.asset(
              AppIcons.ascendingDownSortingIcon,
              width: 40.r,
              height: 40.r,
            ),
          ),
        ],
      ),
    );
  }
}
