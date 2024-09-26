import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class GlobalSearchBarWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  const GlobalSearchBarWidget(
      {super.key, this.height, this.width, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45.sp,
      margin: margin ?? const EdgeInsetsDirectional.only(end: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ThemeColors.secondary.shade200),
        color: ThemeColors.primary.shade50,
      ),
      child: StandardSearchBar(
        hintStyle: const TextStyle(height: 1),
        textStyle: const TextStyle(height: 1),
        width: width ?? 255.w,
        startIconColor: ThemeColors.secondary.shade500,
        shadow: const [],
        suggestions: const [
          'apple',
          'banana',
          'melon',
          'orange',
          'pineapple',
          'strawberry',
          'watermelon'
        ],
      ),
    );
  }
}
