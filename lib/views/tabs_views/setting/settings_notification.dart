import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SettingsNotification extends StatefulWidget {
  const SettingsNotification({super.key});

  @override
  State<SettingsNotification> createState() => _SettingsNotificationState();
}

class _SettingsNotificationState extends State<SettingsNotification> {
  bool emailNotifyIsEnabled = true;
  bool activityNotifyIsEnabled = true;
  List<NotificationConfig> emailNotificationConfig = [
    NotificationConfig(
      "News and Update Settings",
      "The latest news about the latest features and software update settings",
      true,
    ),
    NotificationConfig(
      "Tips and Tutorials",
      "Tips and tricks in order to increase your performance efficiency",
      false,
    ),
    NotificationConfig(
      "Offer and Promotions",
      "Promotions about software package prices and about the latest discounts",
      true,
    ),
  ];
  List<NotificationConfig> activityNotificationConfig = [
    NotificationConfig(
      "All Reminders & Activity",
      "Notify me all system activities and reminders that have been created",
      false,
    ),
    NotificationConfig(
      "Activity only",
      "Only notify me we have the latest activity updates about increasing or decreasing data",
      false,
    ),
    NotificationConfig(
      "Important Reminder only",
      "Only notify me all the reminders that have been made",
      true,
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
              title: "Notification ",
              subTitle:
                  "Get notified what's happening right now. you can turn off at any time",
              horizontalTitleAndSub: sizingInfo.isMobile,
              trailing: null,
            ),
            const Divider(),
            NotificationConfigItemWidget(
              title: "Email Notifications",
              description:
                  "Substance can send you email notifications for any new direct messages",
              isEnabled: emailNotifyIsEnabled,
              onEnabledChange: (p0) {
                emailNotifyIsEnabled = p0;
                setState(() {});
              },
              configList: emailNotificationConfig,
              onConfigSelectionChange: (p0) {
                emailNotificationConfig[p0].changeSelection();
                setState(() {});
              },
            ),
            const Divider(),
            NotificationConfigItemWidget(
              title: "More Activity",
              description:
                  "More option about email notifications for any new direct messages",
              isEnabled: activityNotifyIsEnabled,
              onEnabledChange: (p0) {
                activityNotifyIsEnabled = p0;
                setState(() {});
              },
              configList: activityNotificationConfig,
              onConfigSelectionChange: (p0) {
                activityNotificationConfig[p0].changeSelection();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}

class NotificationConfigItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isEnabled;
  final List<NotificationConfig> configList;
  final Function(int index) onConfigSelectionChange;
  final Function(bool) onEnabledChange;
  const NotificationConfigItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.configList,
    required this.onConfigSelectionChange,
    required this.onEnabledChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.sp),
              SizedBox(
                width: 250.w,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ThemeColors.secondary.shade400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-5, 0),
                    child: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: isEnabled,
                        activeColor: ThemeColors.primary,
                        onChanged: (value) {
                          onEnabledChange(value);
                        },
                      ),
                    ),
                  ),
                  Text(isEnabled ? "On" : "Off")
                ],
              ),
              SizedBox(height: 5.sp),
              ...List.generate(
                configList.length,
                (index) => _buildNotificationConfigItem(
                  config: configList[index],
                  isEnabled: isEnabled,
                  onChange: () {
                    onConfigSelectionChange(index);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationConfigItem({
    required NotificationConfig config,
    required Function() onChange,
    required bool isEnabled,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: InkWell(
        onTap: isEnabled
            ? () {
                onChange();
              }
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
              height: 24,
              child: Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  value: config.value,
                  activeColor: ThemeColors.information,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fillColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (config.value) return ThemeColors.information;

                      return null;
                    },
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(config.title),
                SizedBox(height: 3.sp),
                Text(
                  config.description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ThemeColors.secondary.shade400,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationConfig {
  final String title;
  final String description;
  bool value;

  NotificationConfig(this.title, this.description, this.value);

  void changeSelection() {
    value = !value;
  }
}
