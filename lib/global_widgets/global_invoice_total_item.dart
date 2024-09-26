import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalInvoiceTotalItem extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  const GlobalInvoiceTotalItem({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4, horizontal: 0),
      minVerticalPadding: 0,
      dense: true,
      title: Text(
        label,
        style: labelStyle ??
            TextStyle(
              color: ThemeColors.secondary.shade400,
              fontSize: 14.sp,
            ),
      ),
      trailing: Text(
        value,
        style: valueStyle ??
            TextStyle(
                color: ThemeColors.secondary,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp),
      ),
    );
  }
}
