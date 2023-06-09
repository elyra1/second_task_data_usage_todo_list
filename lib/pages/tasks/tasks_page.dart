import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_task_data_usage_todo_list/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/pages/add_task/add_page.dart';
import 'package:second_task_data_usage_todo_list/pages/info/info_page.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/tasks_list.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/widgets/app_bottom_bar.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/widgets/no_tasks_column.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';
import 'package:second_task_data_usage_todo_list/utils/app_icons.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<TaskBloc>(context);
    bloc.add(
      const InitialLoad(),
    );
    bloc.add(
      SortList(sortType: bloc.state.sortType),
    );
  }

  bool isCompletedHidden = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        context.read<TaskBloc>().add(
              SortList(
                sortType: state.sortType,
              ),
            );
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                physics: (state.completedTasks.isEmpty &&
                        state.uncompletedTasks.isEmpty)
                    ? const NeverScrollableScrollPhysics()
                    : const ScrollPhysics(),
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
                            onTap: () {
                              setState(() {
                                isCompletedHidden = !isCompletedHidden;
                              });
                            },
                            child: Text(
                              isCompletedHidden
                                  ? "Show completed"
                                  : "Hide completed",
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
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 25.h,
                        left: 27.w,
                        right: 14.w,
                      ),
                      child: !(state.completedTasks.isEmpty &&
                              state.uncompletedTasks.isEmpty)
                          ? TasksList(
                              completedTasks: state.completedTasks,
                              uncompletedTasks: state.uncompletedTasks,
                              isCompletedHidden: isCompletedHidden,
                            )
                          : const NoTasksColumn(),
                    ),
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
                            top: Radius.circular(
                              10.r,
                            ),
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
        bottomNavigationBar: AppBottomBar(
          sortType: state.sortType,
        ),
      ),
    );
  }
}
