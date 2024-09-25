import 'package:android_pos_ui/global_widgets/global_profile_dropdown_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class GlobalSideBarDrawerWidget extends StatelessWidget {
  final void Function(int)? onSelect;
  const GlobalSideBarDrawerWidget({
    super.key,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SideBarAnimated(
      borderRadius: 0,
      onTap: onSelect,
      sideBarColor: ThemeColors.primary.shade50,
      animatedContainerColor: ThemeColors.primary.shade100,
      widthSwitch: 100,
      selectedColor: ThemeColors.primary,
      minimizeIcon: Icons.menu,
      expandIcon: Icons.menu,

      unSelectedTextColor: ThemeColors.secondary.shade400,
      unselectedIconColor: ThemeColors.secondary.shade400,
      minimizeButtonColor: ThemeColors.secondary.shade400,
      highlightColor: ThemeColors.secondary.shade100,
      hoverColor: ThemeColors.secondary.shade100,
      // dividerColor: Colors.red,
      splashColor: ThemeColors.primary,
      sideBarWidth: 200.w,
      settingsDivider: false,

      topWidgetExpanded: SvgPicture.asset("assets/logo.svg"),
      topWidgetMinimize: SvgPicture.asset("assets/logo.svg"),
      sidebarItems: [
        SideBarItem(
          iconSelectedSvg: "assets/pos_icon_outlined.svg",
          text: 'POS',
        ),
        SideBarItem(
          iconSelectedSvg: "assets/overview_icon_outlined.svg",
          text: 'Overview',
        ),
        SideBarItem(
          iconSelectedSvg: "assets/product_icon_outlined.svg",
          text: 'Product',
        ),
        SideBarItem(
          iconSelectedSvg: "assets/setting_icon_outlined.svg",
          text: 'Settings',
        ),
        SideBarItem(
          iconSelectedSvg: "assets/help_icon_outlined.svg",
          text: 'Help Center',
        ),
      ],

      bottomWidgetExpanded: const GlobalProfileDropdownWidget(
        isMinimized: true,
      ),
      bottomWidgetMinimize: const GlobalProfileDropdownWidget(
        isMinimized: false,
      ),
    );
  }
}
