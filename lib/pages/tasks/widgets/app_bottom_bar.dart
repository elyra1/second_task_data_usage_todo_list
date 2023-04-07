import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_task_data_usage_todo_list/models/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/models/sort_type.dart';
import 'package:second_task_data_usage_todo_list/utils/app_icons.dart';

class AppBottomBar extends StatelessWidget {
  final SortType sortType;
  const AppBottomBar({
    super.key,
    required this.sortType,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TaskBloc>();
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "alphabeticalSorting",
            icon: GestureDetector(
              onTap: () {
                bloc.add(
                  const UpdateSortType(
                    sortType: SortType.alphabeticalSort,
                  ),
                );
                bloc.add(
                  const SortList(
                    sortType: SortType.alphabeticalSort,
                  ),
                );
              },
              child: SvgPicture.asset(
                sortType.type == SortType.alphabeticalSort.type
                    ? AppIcons.alphabeticalSortingIconSelected
                    : AppIcons.alphabeticalSortingIcon,
                width: 40.r,
                height: 40.r,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "alphabeticalSortingTwo",
            icon: GestureDetector(
              onTap: () {
                bloc.add(
                  const UpdateSortType(
                    sortType: SortType.alphabeticalSortReversed,
                  ),
                );
                bloc.add(
                  const SortList(
                    sortType: SortType.alphabeticalSortReversed,
                  ),
                );
              },
              child: SvgPicture.asset(
                sortType.type == SortType.alphabeticalSortReversed.type
                    ? AppIcons.alphabeticalSortingTwoIconSelected
                    : AppIcons.alphabeticalSortingTwoIcon,
                width: 40.r,
                height: 40.r,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "ascendingDownSorting",
            icon: GestureDetector(
              onTap: () {
                bloc.add(
                  const UpdateSortType(
                    sortType: SortType.dateSort,
                  ),
                );
                bloc.add(
                  const SortList(
                    sortType: SortType.dateSort,
                  ),
                );
              },
              child: SvgPicture.asset(
                sortType.type == SortType.dateSort.type
                    ? AppIcons.ascendingDownSortingIconSelected
                    : AppIcons.ascendingDownSortingIcon,
                width: 40.r,
                height: 40.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
