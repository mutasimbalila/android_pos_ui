import 'dart:math';

import 'package:android_pos_ui/global_widgets/global_category_list_bar_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalCategoryItemWidget extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final bool showSmallWidget;
  final Function() onItemSelected;
  const GlobalCategoryItemWidget({
    super.key,
    required this.category,
    required this.onItemSelected,
    required this.isSelected,
    required this.showSmallWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInfo) {
        return Container(
          width: (showSmallWidget || sizingInfo.isMobile) ? null : 165.sp,
          height: (showSmallWidget || sizingInfo.isMobile) ? null : 60.w,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          decoration: BoxDecoration(
            color: ThemeColors.primary.shade50,
            border: Border.all(
                color: isSelected
                    ? ThemeColors.primary
                    : ThemeColors.secondary.shade200),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(7.r),
            child: InkWell(
              onTap: () {
                onItemSelected();
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: (showSmallWidget || sizingInfo.isMobile)
                    ? Row(
                        mainAxisAlignment: showSmallWidget
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          if (category.icon != null) _categoryIconWidget(),
                          categoryTitleAndCount(false)
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (category.icon != null) _categoryIconWidget(),
                          categoryTitleAndCount(true)
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row categoryTitleAndCount(bool showItemCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: isSelected ? ThemeColors.primary : ThemeColors.secondary,
          ),
        ),
        if (showItemCount)
          Text(
            "${Random().nextInt(80) + 10} items",
            style: TextStyle(
              fontSize: 12.sp,
              color: ThemeColors.secondary.shade400,
            ),
          ),
      ],
    );
  }

  Widget _categoryIconWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 5),
      child: Icon(
        category.icon,
        size: 20.sp,
        color:
            isSelected ? ThemeColors.primary : ThemeColors.secondary.shade500,
      ),
    );
  }
}
