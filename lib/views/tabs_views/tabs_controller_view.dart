import 'package:android_pos_ui/global_widgets/global_app_bar_mobile.dart';
import 'package:android_pos_ui/global_widgets/global_sidebar_drawer_widget.dart';
import 'package:android_pos_ui/views/tabs_views/overview/overview_tab_view.dart';
import 'package:android_pos_ui/views/tabs_views/pos/pos_tab_view.dart';
import 'package:android_pos_ui/views/tabs_views/product/product_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TabsControllerView extends StatefulWidget {
  const TabsControllerView({super.key});

  @override
  State<TabsControllerView> createState() => _TabsControllerViewState();
}

class _TabsControllerViewState extends State<TabsControllerView> {
  int selectedTab = 0;
  final tabsViewList = [
    const PosTabView(),
    const OverviewTabView(),
    const ProductTabView(),
    const Text("Settings"),
    const Text("Help Center"),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          appBar:
              (sizingInfo.isMobile) ? const GlobalAppBarMobile() : null,
          backgroundColor: const Color(0xffF6F8F9),
          body: Row(
            children: [
              if (!sizingInfo.isMobile)
                GlobalSideBarDrawerWidget(
                  onSelect: (value) {
                    selectedTab = value;
                    setState(() {});
                  },
                ),
              Expanded(child: Center(child: tabsViewList[selectedTab])),
            ],
          ),
          drawer: sizingInfo.isMobile
              ? SafeArea(
                  child: GlobalSideBarDrawerWidget(
                    onSelect: (value) {
                      selectedTab = value;
                      setState(() {});
                    },
                  ),
                )
              : null,
        );
      },
    );
  }
}
