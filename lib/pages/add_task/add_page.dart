import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:second_task_data_usage_todo_list/data/db.dart';
import 'package:second_task_data_usage_todo_list/bloc/task_bloc.dart';
import 'package:second_task_data_usage_todo_list/pages/add_task/widgets/add_page_app_bar.dart';
import 'package:second_task_data_usage_todo_list/pages/add_task/widgets/name_text_field.dart';
import 'package:second_task_data_usage_todo_list/pages/add_task/widgets/picker_fields.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';
import 'package:second_task_data_usage_todo_list/widgets/app_button.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TaskBloc>();

    void showAppTimePicker() {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then(
        (value) {
          setState(
            () {
              time = value ?? TimeOfDay.now();
            },
          );
        },
      );
    }

    void showAppDataPicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then(
        (value) {
          setState(
            () {
              date = value ?? DateTime.now();
            },
          );
        },
      );
    }

    return BlocProvider(
      create: (context) => TaskBloc(),
      child: FractionallySizedBox(
        heightFactor: 0.92,
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return Scaffold(
              appBar: const AddPageAppBar(),
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
                          style: AppTextStyles.buttonStyle.copyWith(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Form(
                          key: _formKey,
                          child: NameTextField(
                            controller: nameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Time",
                          style: AppTextStyles.buttonStyle.copyWith(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 22.w,
                        ),
                        TimePickerField(
                          onTap: showAppTimePicker,
                          time: time,
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
                          style: AppTextStyles.buttonStyle.copyWith(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 22.w,
                        ),
                        DatePickerField(
                          onTap: showAppDataPicker,
                          date: date,
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
                        if (_formKey.currentState!.validate()) {
                          bloc.add(
                            AddTask(
                              task: Task(
                                id: -1,
                                title: nameController.text,
                                time: time.format(context),
                                date: DateFormat('dd.MM.yyyy').format(date),
                                isCompleted: false,
                              ),
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
