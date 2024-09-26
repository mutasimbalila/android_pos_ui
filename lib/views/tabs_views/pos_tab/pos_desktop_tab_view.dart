import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_category_list_bar_widget.dart';
import 'package:android_pos_ui/global_widgets/global_item_widget.dart';
import 'package:android_pos_ui/global_widgets/global_search_bar_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/tabs_views/pos_tab/grid_view_items_widget.dart';
import 'package:android_pos_ui/views/tabs_views/pos_tab/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PosDesktopTabView extends StatefulWidget {
  const PosDesktopTabView({super.key});

  @override
  State<PosDesktopTabView> createState() => _PosDesktopTabViewState();
}

class _PosDesktopTabViewState extends State<PosDesktopTabView> {
  int selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                GlobalAppBarDeskTop(
                  title: "Let’s do your best today 🚀",
                  subTitle: "December 18,2023",
                  trailing: _buildSearchAndFilterButton(),
                ),
                GlobalCategoryListBarWidget(list: categoryDummyList),
                Divider(height: 30.h, color: ThemeColors.secondary.shade200),
                const Expanded(child: GridViewItemsWidget()),
              ],
            ),
          ),
        ),
        OrderDetailsView(
          itemsDummyList: itemsDummyList,
          onUnSelect: (p0) {
            itemsDummyList[p0].isSelected = false;
            setState(() {});
          },
        )
      ],
    );
  }

  Row _buildSearchAndFilterButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const GlobalSearchBarWidget(),
        GlobalAppBarButtonItemWidget(
          svgIcon: "assets/filter_icon.svg",
          onTap: () {},
          size: 45.sp,
          margin: EdgeInsetsDirectional.zero,
        )
      ],
    );
  }
}
