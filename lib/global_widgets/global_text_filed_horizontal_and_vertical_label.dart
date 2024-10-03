import 'package:android_pos_ui/global_widgets/global_text_filed_custom_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalTextFiledHorizontalAndVerticalLabel extends StatelessWidget {
  final String label;

  final bool enabled;
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool? obscureText;
  final Widget? prefixIcon;

  final EdgeInsetsGeometry? margin;
  const GlobalTextFiledHorizontalAndVerticalLabel({
    super.key,
    this.enabled = true,
    this.margin,
    required this.label,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.obscureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.only(bottom: 25.h),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 2),
                _buildTextFiled(),
              ],
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 3, child: _buildTitle()),
                Expanded(flex: 5, child: _buildTextFiled()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildTextFiled() {
    return GlobalTextFiledCustomWidget(
      hint: hint,
      margin: EdgeInsets.zero,
      controller: controller,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      prefixIcon: prefixIcon,
    );
  }

  Text _buildTitle() {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16.sp,
        color: ThemeColors.secondary.shade400,
      ),
    );
  }
}
