import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_category_list_bar_widget.dart';
import 'package:android_pos_ui/global_widgets/global_item_widget.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/tabs_views/pos_tab/grid_view_items_widget.dart';
import 'package:android_pos_ui/views/tabs_views/pos_tab/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PosMobileTabView extends StatefulWidget {
  const PosMobileTabView({super.key});

  @override
  State<PosMobileTabView> createState() => _PosMobileTabViewState();
}

class _PosMobileTabViewState extends State<PosMobileTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ThemeColors.primary.shade50,
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              // GlobalSearchBarWidget(
              //   height: 50.sp,
              //   width: double.infinity,
              //   margin: EdgeInsets.only(bottom: 10.sp),
              // ),
              GlobalCategoryListBarWidget(
                list: categoryDummyList,
                margin: EdgeInsets.only(bottom: 10.sp),
                fillSelectionColor: true,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.sp),
            child: const GridViewItemsWidget(),
          ),
        ),
        Container(
            color: ThemeColors.primary.shade50,
            padding: EdgeInsets.all(10.sp),
            child: GlobalButtonWidget(
              label: "Continue",
              onTap: () {
                Nav.push(
                    context,
                    Scaffold(
                      body: OrderDetailsView(
                        itemsDummyList: itemsDummyList,
                        onUnSelect: (p0) {},
                      ),
                    ));
              },
            )),
      ],
    );
  }
}
