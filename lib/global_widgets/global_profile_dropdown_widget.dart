import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/splash/splash_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalProfileDropdownWidget extends StatelessWidget {
  final bool isMinimized;
  const GlobalProfileDropdownWidget({super.key, required this.isMinimized});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Container(
          decoration: isMinimized
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(
                    color: ThemeColors.secondary.shade200,
                  ),
                )
              : null,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            horizontalTitleGap: 0,
            dense: true,
            leading: CircleAvatar(
              maxRadius: 18.r,
              backgroundImage: const NetworkImage(
                  "https://randomuser.me/api/portraits/men/66.jpg"),
              backgroundColor: Colors.transparent,
            ),
            title: isMinimized
                ? Text(
                    "Leonard B.",
                    style: TextStyle(
                      color: ThemeColors.secondary.shade500,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
            subtitle: isMinimized
                ? Text(
                    "Staff",
                    style: TextStyle(
                      color: ThemeColors.secondary.shade400,
                      fontSize: 12.sp,
                    ),
                  )
                : null,
            trailing: isMinimized
                ? Icon(
                    Icons.arrow_drop_down,
                    color: ThemeColors.secondary.shade400,
                  )
                : null,
          ),
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value! as MenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            // color: Colors.white,
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem(
    this.color, {
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
  final Color color;
}

abstract class MenuItems {
  static final List<MenuItem> firstItems = [home];
  static final List<MenuItem> secondItems = [logout];

  static final home =
      MenuItem(text: 'Profile', icon: Icons.person, ThemeColors.secondary);
  static const logout =
      MenuItem(text: 'Log Out', icon: Icons.logout, Colors.red);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: item.color, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: TextStyle(
              color: item.color,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item.icon) {
      case Icons.person:
        //Do something
        break;

      case Icons.logout:
        Nav.pushRemoveUntil(context, const SplashView());
        break;
    }
  }
}
