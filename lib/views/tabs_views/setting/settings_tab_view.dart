import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/tabs_views/setting/setting_account.dart';
import 'package:android_pos_ui/views/tabs_views/setting/settings_notification.dart';
import 'package:android_pos_ui/views/tabs_views/setting/settings_preferences.dart';
import 'package:android_pos_ui/views/tabs_views/setting/settings_user_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class SettingsTabView extends StatefulWidget {
  const SettingsTabView({super.key});

  @override
  State<SettingsTabView> createState() => _SettingsTabViewState();
}

class _SettingsTabViewState extends State<SettingsTabView> {
  int selectedIndex = 0;
  final settingsViews = [
    // const SettingsGeneral(),
    const SettingsPreferences(),
    const SettingsUsersPermissions(),
    const SettingAccount(),
    const SettingsNotification(),
    // const Text("Billings"),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    GlobalAppBarDeskTop(
                      title: "Settings",
                      subTitle: "Let’s Manage your pos",
                      width: 200.sp,
                      horizontalTitleAndSub: sizingInfo.isMobile,
                      trailing: null,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalButtonWidget(
                          label: "Cancel",
                          width: sizingInfo.isMobile ? null : 135.w,
                          backgroundColor: ThemeColors.primary.shade50,
                          borderColor: ThemeColors.secondary.shade200,
                          textColor: ThemeColors.secondary,
                          margin: EdgeInsetsDirectional.only(end: 10.w),
                          iconAlignment: IconAlignment.end,
                          onTap: () async {},
                        ),
                        GlobalButtonWidget(
                          label: "Save",
                          width: sizingInfo.isMobile ? null : 135.w,
                          // margin: EdgeInsetsDirectional.only(end: 10.w),
                          iconAlignment: IconAlignment.end,
                          onTap: () async {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Row(
                    children: [
                      SettingsSideBarMenu(
                        onSelect: (p0) {
                          selectedIndex = p0;
                          setState(() {});
                        },
                        // selectedIndex: selectedIndex,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 15.sp),
                          decoration: BoxDecoration(
                            color: ThemeColors.primary.shade50,
                            border: Border.all(
                                color: ThemeColors.secondary.shade200),
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: settingsViews[selectedIndex],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsSideBarMenu extends StatelessWidget {
  final void Function(int)? onSelect;
  // final int selectedIndex;
  const SettingsSideBarMenu({
    super.key,
    required this.onSelect,
    // required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235.w,
      margin: EdgeInsetsDirectional.only(end: 14.w),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: ThemeColors.primary.shade50,
        border: Border.all(color: ThemeColors.secondary.shade200),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Sub Sttings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SideBarAnimated(
              borderRadius: 0,
              onTap: onSelect,
              showHeader: false,
              // topPadding: 10,
              // initialIndex: selectedIndex,
              sideBarColor: ThemeColors.primary.shade50,
              animatedContainerColor: ThemeColors.primary.shade100,
              widthSwitch: 100,
              selectedColor: ThemeColors.primary,
              minimizeIcon: Icons.menu,
              topPadding: 10,
              unSelectedTextColor: ThemeColors.secondary.shade400,
              unselectedIconColor: ThemeColors.secondary.shade400,
              minimizeButtonColor: ThemeColors.secondary.shade400,
              highlightColor: ThemeColors.secondary.shade100,
              hoverColor: ThemeColors.secondary.shade100,
              splashColor: ThemeColors.primary,
              sideBarWidth: 280.w,
              settingsDivider: false,

              // topWidgetExpanded: const Text("data"),

              sidebarItems: [
                // SideBarItem(
                //   iconSelectedSvg: "assets/general_settings_icon.svg",
                //   text: "General",
                // ),
                SideBarItem(
                  iconSelectedSvg: "assets/preferences_settings_icon.svg",
                  text: "Preferences",
                ),
                SideBarItem(
                  iconSelectedSvg: "assets/permissions_settings_icon.svg",
                  text: "User Permissions",
                ),
                SideBarItem(
                  iconSelectedSvg: "assets/account_settings_icon.svg",
                  text: "Account",
                ),
                SideBarItem(
                  iconSelectedSvg: "assets/notifications_settings_icon.svg",
                  text: "Notifications",
                ),
                // SideBarItem(
                //   iconSelectedSvg: "assets/billings_settings_icon.svg",
                //   text: "Billings",
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
