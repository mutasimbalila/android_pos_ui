import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_textFiled_custom_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NewPasswordForm extends StatefulWidget {
  final Function() onResetDone;

  const NewPasswordForm({super.key, required this.onResetDone});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final passwordController = TextEditingController();
  Color strengthColor = ThemeColors.warning.shade800;
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
                        "Create new password",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1C2634),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Let's create a new and more secure password",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ThemeColors.secondary.shade400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GlobalTextFiledCustomWidget(
                        label: "New Password",
                        hint: "*******",
                        controller: passwordController,
                        obscureText: true,
                        onChanged: (p0) {
                          setState(() {});
                        },
                      ),
                      GlobalTextFiledCustomWidget(
                        label: "Repeat Password",
                        hint: "*******",
                        controller: passwordController,
                        obscureText: true,
                      ),
                      GlobalButtonWidget(
                        label: "Continue",
                        onTap: () {
                          widget.onResetDone();
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
}
