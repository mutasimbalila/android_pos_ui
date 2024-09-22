import 'package:android_pos_ui/utils/colors.dart';
import 'package:android_pos_ui/views/login_view/login_fields_buttons_sub_view.dart';
import 'package:android_pos_ui/views/login_view/widget/onboarding_image_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        mobile: (_) => _buildMobileView(),
        tablet: (_) => _buildDesktopView(),
        desktop: (_) => _buildDesktopView(),
      ),
    );
  }

  _buildMobileView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Expanded(
                  child: LoginFieldsAndButtonsSubView(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAllRightsReserved(),
                    _buildTermAndConditionAndPrivacyPolicy(),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const OnboardingImageWidget(),
        ],
      ),
    );
  }

  _buildDesktopView() {
    return Row(
      children: [
        const Expanded(
          child: OnboardingImageWidget(),
        ),
        Expanded(
          child: Column(
            children: [
              const Expanded(
                child: LoginFieldsAndButtonsSubView(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAllRightsReserved(),
                  _buildTermAndConditionAndPrivacyPolicy(),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  Text _buildAllRightsReserved() {
    return Text(
      "© 2024 Posive. All rights reserved.",
      style: TextStyle(
        color: ThemeColor.secondary.shade400,
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
                color: ThemeColor.information,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
          ),
          Container(
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            color: ThemeColor.secondary.shade300,
            height: 21.h,
          ),
          RichText(
            text: TextSpan(
              text: "Privacy & Policy",
              recognizer: TapGestureRecognizer()..onTap = () => {},
              style: TextStyle(
                color: ThemeColor.information,
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
