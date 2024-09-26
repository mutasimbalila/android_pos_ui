import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalAppBarDeskTop extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? trailing;
  final double? titleFontSize;
  final double? subTitleFontSize;
  final EdgeInsetsDirectional? margin;
  const GlobalAppBarDeskTop({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trailing,
    this.titleFontSize,
    this.subTitleFontSize,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.only(bottom: 15.h),
      child: ListTile(
          // dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize ?? 24.sp,
              color: ThemeColors.secondary,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              fontSize: subTitleFontSize ?? 14.sp,
              color: ThemeColors.secondary.shade400,
            ),
          ),
          trailing: trailing),
    );
  }
}
