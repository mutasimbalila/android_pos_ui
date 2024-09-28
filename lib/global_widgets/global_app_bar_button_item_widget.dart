import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GlobalAppBarButtonItemWidget extends StatelessWidget {
  final String svgIcon;
  final double? size;
  final EdgeInsetsDirectional? margin;
  final Function() onTap;
  const GlobalAppBarButtonItemWidget({
    super.key,
    required this.svgIcon,
    required this.onTap,
    this.size,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(5),
      child: SizedBox(
        width: size ?? 50.sp,
        height: size ?? 50.sp,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColors.primary.shade50,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero, // Set this

              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(color: ThemeColors.secondary.shade200),
              ),
              // shadowColor: Colors.grey.shade100,
            ),
            child: SvgPicture.asset(
              svgIcon,
              colorFilter: ColorFilter.mode(
                ThemeColors.secondary.shade500,
                BlendMode.srcIn,
              ),
              width: 17.sp,
            )),
      ),
    );
  }
}
