import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_text_filed_custom_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SettingAccount extends StatefulWidget {
  const SettingAccount({super.key});

  @override
  State<SettingAccount> createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();

  late final List<Widget> textFiledList = [
    GlobalTextFiledCustomWidget(
      hint: "Leonard Brown",
      label: "Full Name",
      enabled: false,
      controller: nameController,
    ),
    GlobalTextFiledCustomWidget(
      hint: "leonbrown@mail.com",
      label: "Email Address",
      enabled: false,
      controller: emailController,
    ),
    GlobalTextFiledCustomWidget(
      hint: "+212311412141",
      label: "Phone",
      enabled: false,
      controller: phoneController,
    ),
    GlobalTextFiledCustomWidget(
      label: "Gender",
      hint: "Male",
      enabled: false,
      controller: genderController,
    ),
    GlobalTextFiledCustomWidget(
      label: "Birth of Date",
      hint: "01 - 01 - 2024",
      enabled: false,
      suffixIcon: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/calendar_icon.svg",
          colorFilter: ColorFilter.mode(
            ThemeColors.secondary.shade500,
            BlendMode.dstIn,
          ),
        ),
      ),
      controller: null,
    ),
    GlobalTextFiledCustomWidget(
      label: "Password",
      hint: "Password",
      enabled: false,
      obscureText: true,
      margin: EdgeInsets.zero,
      controller: TextEditingController(text: "passowrd"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalAppBarDeskTop(
              title: "Your Account  ",
              subTitle: "Manage who has access in your system",
              horizontalTitleAndSub: sizingInfo.isMobile,
              trailing: null,
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: 8.sp, top: 10.sp),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.secondary,
                ),
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 32.r,
                  backgroundImage: const NetworkImage(
                      "https://randomuser.me/api/portraits/men/66.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                GlobalButtonWidget(
                  label: "Upload new",
                  width: 145.w,
                  margin: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                  onTap: () {},
                ),
                GlobalButtonWidget(
                  label: "Delete",
                  width: sizingInfo.isMobile ? null : 135.w,
                  backgroundColor: ThemeColors.primary.shade50,
                  borderColor: ThemeColors.secondary.shade200,
                  textColor: ThemeColors.secondary,
                  margin: EdgeInsetsDirectional.zero,
                  iconAlignment: IconAlignment.end,
                  onTap: () async {},
                ),
              ],
            ),
            //TODO
            // OverflowBar(),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GridView.builder(
                // shrinkWrap: true,--
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 0,
                    childAspectRatio: (1 / .2)

                    // mainAxisExtent: 100.sp,
                    ),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: textFiledList.length,
                itemBuilder: (context, index) {
                  return textFiledList[index];
                },
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delete account",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        "When you delete your account, you lose access to Front account services, and we permanently delete your personal data. You can cancel the deletion for 14 days.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ThemeColors.secondary.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      GlobalButtonWidget(
                        label: "Delete account",
                        width: 145.w,
                        backgroundColor: ThemeColors.error,
                        margin:
                            EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                        onTap: () {},
                      ),
                      GlobalButtonWidget(
                        label: "Learn more",
                        width: 145.w,
                        backgroundColor: ThemeColors.primary.shade50,
                        borderColor: ThemeColors.secondary.shade200,
                        textColor: ThemeColors.secondary,
                        margin: EdgeInsetsDirectional.zero,
                        iconAlignment: IconAlignment.end,
                        onTap: () async {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [

            //     GlobalTextFiledCustomWidget(
            //       hint: "Leonard Brown",
            //       controller: nameController,
            //     ),
            //   ],
            // )
          ],
        );
      },
    );
  }
}
