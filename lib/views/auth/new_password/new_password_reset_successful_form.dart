import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResetPasswordSuccessfulForm extends StatefulWidget {
  const ResetPasswordSuccessfulForm({super.key});

  @override
  State<ResetPasswordSuccessfulForm> createState() =>
      _ResetPasswordSuccessfulFormState();
}

class _ResetPasswordSuccessfulFormState
    extends State<ResetPasswordSuccessfulForm> {
  final passwordController = TextEditingController();
  Color strengthColor = ThemeColors.warning.shade800;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Center(
          child: SizedBox(
            width: sizingInfo.isMobile ? size.width * 0.87 : size.width * 0.29,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 15.h),
                      //   child: IconButton(
                      //     onPressed: () => Nav.pop(context),
                      //     padding: EdgeInsets.zero,
                      //     constraints: const BoxConstraints(),
                      //     icon: SvgPicture.asset("assets/arrow_left_back.svg"),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 25.h),
                        child: SvgPicture.asset("assets/successful.svg"),
                      ),
                      Text(
                        "Reset password successful",
                        style: TextStyle(
                          fontSize: 31.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1C2634),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Successfully changed password. you can enter the main page",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ThemeColors.secondary.shade400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GlobalButtonWidget(
                        label: "Go to home",
                        onTap: () {
                          Nav.pop(context);
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
