import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalAppBarMobile extends StatelessWidget
    implements PreferredSizeWidget {
  const GlobalAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 100,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalAppBarButtonItemWidget(
              svgIcon: "assets/menu_icon.svg",
              onTap: () {},
            ),
            const Spacer(),
            GlobalAppBarButtonItemWidget(
              svgIcon: "assets/search_icon.svg",
              onTap: () {},
            ),
            GlobalAppBarButtonItemWidget(
              svgIcon: "assets/filter_icon.svg",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60.sp);
}