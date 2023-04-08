import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => TaskBloc(),
          child: const MaterialApp(
            home: TasksPage(),
          ),
        );
      },
    );
  }
}
