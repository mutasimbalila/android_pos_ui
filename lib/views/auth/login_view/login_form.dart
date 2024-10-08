import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_text_filed_custom_widget.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/auth/login_view/widget/checkbox_custom_widget.dart';
import 'package:android_pos_ui/views/auth/reset_password/reset_password_view.dart';
import 'package:android_pos_ui/views/tabs_views/tabs_controller_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginFormSubView extends StatefulWidget {
  const LoginFormSubView({super.key});

  @override
  State<LoginFormSubView> createState() => _LoginFormSubViewState();
}

class _LoginFormSubViewState extends State<LoginFormSubView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
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
              children: [
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: SvgPicture.asset(
                    "assets/logo.svg",
                    width: 34.sp,
                  ),
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1C2634),
                  ),
                ),
                SizedBox(height: 20.h),
                GlobalTextFiledCustomWidget(
                  label: "Email",
                  hint: "example@email.com",
                  controller: emailController,
                  obscureText: false,
                ),
                GlobalTextFiledCustomWidget(
                  label: "Password",
                  hint: "*******",
                  controller: emailController,
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckBoxCustomWidget(
                      label: "Remember me",
                      value: rememberMe,
                      onChanged: (value) {},
                    ),
                    TextButton(
                      onPressed: () {
                        Nav.push(context, const ResetPasswordView());
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: ThemeColors.information.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                GlobalButtonWidget(
                  label: "Login",
                  onTap: () {
                    Nav.pushRemoveUntil(context, const TabsControllerView());
                  },
                ),
                _buildDividerAndOrText(),
                RichText(
                  text: TextSpan(
                    text: "Don’t have an account ? ",
                    style: TextStyle(
                      color: ThemeColors.secondary.shade400,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: "Register Here",
                        recognizer: TapGestureRecognizer()..onTap = () => {},
                        style: TextStyle(
                          color: ThemeColors.information,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      )
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
