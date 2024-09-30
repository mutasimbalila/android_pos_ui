import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalAppBarMobile extends StatelessWidget
    implements PreferredSizeWidget {
  const GlobalAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ThemeColors.primary.shade50,
        padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.h),
        child: SizedBox(
          height: 80.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalAppBarButtonItemWidget(
                svgIcon: "assets/menu_icon.svg",
                size: 45.sp,
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              const Spacer(),
              GlobalAppBarButtonItemWidget(
                svgIcon: "assets/search_icon.svg",
                size: 45.sp,
                onTap: () {},
              ),
              GlobalAppBarButtonItemWidget(
                svgIcon: "assets/filter_icon.svg",
                size: 45.sp,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.sp);
}
