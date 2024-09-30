import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButtonWidget extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Function() onTap;
  final double? width;
  final double? height;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final EdgeInsetsGeometry? margin;
  const GlobalButtonWidget(
      {super.key,
      required this.label,
      required this.onTap,
      this.width,
      this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.margin,
      this.icon,
      this.height,
      this.iconAlignment = IconAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 50.h,
        child: ElevatedButton.icon(
          iconAlignment: iconAlignment,
          style: ElevatedButton.styleFrom(
            elevation: 0.5,
            backgroundColor: backgroundColor ?? ThemeColors.primary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ??
                    ThemeColors.primary.shade600.withOpacity(0.8),
              ),
              borderRadius: BorderRadius.circular(11.r),
            ),
          ),
          onPressed: onTap,
          icon: icon,
          label: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
