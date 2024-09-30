import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:android_pos_ui/global_widgets/global_search_bar_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTableTitleAndSearchBar extends StatelessWidget {
  final String title;
  const GlobalTableTitleAndSearchBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(3.sp, 0, 3.sp, 13.sp),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.sp,
            color: ThemeColors.secondary,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const GlobalSearchBarWidget(),
            GlobalAppBarButtonItemWidget(
              svgIcon: "assets/filter_icon.svg",
              onTap: () {},
              size: 45.sp,
              margin: EdgeInsetsDirectional.zero,
            )
          ],
        ),
      ),
    );
  }
}
