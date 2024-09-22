import 'package:android_pos_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButtonWidget extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Function() onTap;
  final double? width;
  const GlobalButtonWidget(
      {super.key,
      required this.label,
      required this.onTap,
      this.width,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        width: width ?? double.infinity,
        height: 50.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.5,
            backgroundColor: ThemeColor.primary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: backgroundColor ??
                    ThemeColor.primary.shade600.withOpacity(0.8),
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: onTap,
          child: Text(label),
        ),
      ),
    );
  }
}
