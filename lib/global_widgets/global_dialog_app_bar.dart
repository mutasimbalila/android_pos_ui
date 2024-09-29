import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalDialogAppBar extends StatelessWidget {
  final String title;
  const GlobalDialogAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.sp),
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(
            color: ThemeColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
        trailing: SizedBox(
          width: 45.sp,
          height: 45.sp,
          child: GlobalAppBarButtonItemWidget(
            svgIcon: "assets/close_icon.svg",
            onTap: () {
              Nav.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
