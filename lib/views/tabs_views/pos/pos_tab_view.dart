import 'package:android_pos_ui/views/tabs_views/pos/pos_desktop_tab_view.dart';
import 'package:android_pos_ui/views/tabs_views/pos/pos_mobile_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PosTabView extends StatelessWidget {
  const PosTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (p0) => const PosMobileTabView(),
      desktop: (p0) => const PosDesktopTabView(),
      tablet: (p0) => const PosDesktopTabView(),
    );
  }
}
