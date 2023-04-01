import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/models/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/pages/tasks/tasks_page.dart';

void main() {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => TaskBloc(),
          child: MaterialApp(
            home: TasksPage(),
          ),
        );
      },
    );
  }
}
