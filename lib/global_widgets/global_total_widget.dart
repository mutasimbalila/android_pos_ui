import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalTotalWidget extends StatelessWidget {
  final String title;
  final String value;
  final String svgIcon;
  final double? width;

  const GlobalTotalWidget({
    super.key,
    required this.title,
    required this.value,
    required this.svgIcon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInfo) {
        return Container(
          width: width ?? 273.sp,
          height: 100.w,
          padding: EdgeInsets.all(15.sp),
          // margin: EdgeInsetsDirectional.only(end: 10.w),
          decoration: BoxDecoration(
            color: ThemeColors.primary.shade50,
            border: Border.all(color: ThemeColors.secondary.shade200),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13.sp,
                          color: ThemeColors.secondary.shade400,
                        ),
                      ),
                      Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                          color: ThemeColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SvgPicture.asset("assets/$svgIcon")
            ],
          ),
        );
      },
    );
  }
}
