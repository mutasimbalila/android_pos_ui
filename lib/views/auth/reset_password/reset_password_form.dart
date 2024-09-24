import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_textFiled_custom_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/views/auth/new_password/new_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Center(
          child: SizedBox(
            width: sizingInfo.isMobile ? size.width * 0.87 : size.width * 0.28,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: SvgPicture.asset(
                    "assets/logo.svg",
                    width: 34.sp,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: IconButton(
                          onPressed: () => Nav.pop(context),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: SvgPicture.asset("assets/arrow_left_back.svg"),
                        ),
                      ),
                      Text(
                        "Reset password",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1C2634),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Input your email address account to receive a reset link",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ThemeColors.secondary.shade400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GlobalTextFiledCustomWidget(
                        label: "Email",
                        hint: "example@email.com",
                        controller: emailController,
                        obscureText: false,
                      ),
                      GlobalButtonWidget(
                        label: "Continue",
                        onTap: () {
                          Nav.pushReplacement(context, const NewPasswordView());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDividerAndOrText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              "or",
              style: TextStyle(color: ThemeColors.secondary.shade400),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
