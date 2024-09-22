import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_textFiled_custom_widget.dart';
import 'package:android_pos_ui/utils/colors.dart';
import 'package:android_pos_ui/views/login_view/widget/checkbox_custom_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginFieldsAndButtonsSubView extends StatefulWidget {
  const LoginFieldsAndButtonsSubView({super.key});

  @override
  State<LoginFieldsAndButtonsSubView> createState() =>
      _LoginFieldsAndButtonsSubViewState();
}

class _LoginFieldsAndButtonsSubViewState
    extends State<LoginFieldsAndButtonsSubView> {
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
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: ThemeColor.information.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                GlobalButtonWidget(
                  label: "Login",
                  onTap: () {},
                ),
                _buildDividerAndOrText(),
                RichText(
                  text: TextSpan(
                    text: "Don’t have an account ? ",
                    style: TextStyle(
                      color: ThemeColor.secondary.shade400,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: "Register Here",
                        recognizer: TapGestureRecognizer()..onTap = () => {},
                        style: TextStyle(
                          color: ThemeColor.information,
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
              style: TextStyle(color: ThemeColor.secondary.shade400),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
