import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalTermConditionPrivacyPolicyWidget extends StatelessWidget {
  const GlobalTermConditionPrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAllRightsReserved(),
                _buildTermAndConditionAndPrivacyPolicy(),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAllRightsReserved(),
                _buildTermAndConditionAndPrivacyPolicy(),
              ],
            );
          }
        },
      ),
    );
  }

  Text _buildAllRightsReserved() {
    return Text(
      "© 2024 Posive. All rights reserved.",
      style: TextStyle(
        color: ThemeColors.secondary.shade400,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTermAndConditionAndPrivacyPolicy() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: "Term & Condition",
              recognizer: TapGestureRecognizer()..onTap = () => {},
              style: TextStyle(
                color: ThemeColors.information,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
          ),
          Container(
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            color: ThemeColors.secondary.shade300,
            height: 21.h,
          ),
          RichText(
            text: TextSpan(
              text: "Privacy & Policy",
              recognizer: TapGestureRecognizer()..onTap = () => {},
              style: TextStyle(
                color: ThemeColors.information,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
