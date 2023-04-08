import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task_data_usage_todo_list/utils/app_colors.dart';
import 'package:second_task_data_usage_todo_list/utils/app_text_styles.dart';
import 'package:second_task_data_usage_todo_list/widgets/app_button.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 27.w,
            top: 23.h,
            bottom: 41.h,
            right: 14.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Information",
                style: AppTextStyles.headlineStyle,
              ),
              SizedBox(
                height: 41.h,
              ),
              Expanded(
                child: Text(
                  "Praesent ultricies lacus in ligula volutpat feugiat. In hac habitasse platea dictumst. In hac habitasse platea dictumst. Fusce luctus justo eget nisi hendrerit, quis aliquam arcu porta. Cras ultricies, elit sit amet cursus consectetur, risus felis ullamcorper nulla, ut scelerisque sapien lorem non sem. Integer vestibulum ornare ligula, a placerat lectus volutpat ultrices. Aliquam commodo malesuada purus a mollis. Vestibulum pulvinar aliquam libero eu consequat.\n\nCras massa orci, ultrices sed scelerisque id, semper vel neque. Proin a turpis quis nibh cursus hendrerit sit amet vel libero. Nullam sit amet laoreet ante. Mauris sit amet mi vitae arcu dignissim porttitor et in arcu. Nullam eleifend molestie arcu, pretium fermentum orci feugiat eget. Integer dapibus tincidunt ipsum, at rutrum magna rutrum at. Quisque pretium convallis vestibulum.",
                  style: AppTextStyles.titleStyle,
                ),
              ),
              AppButton(
                height: 46.h,
                title: 'Got it!',
                margin: EdgeInsets.only(
                  left: 3.w,
                  right: 16.w,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
