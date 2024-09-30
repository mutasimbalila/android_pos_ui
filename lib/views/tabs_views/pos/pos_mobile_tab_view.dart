import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_category_list_bar_widget.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/tabs_views/pos/widget/grid_view_product_list_widget.dart';
import 'package:android_pos_ui/order/order_create_details_view.dart';
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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: ThemeColors.primary.shade50,
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    children: [
                      const GlobalAppBarDeskTop(
                        title: "Let’s do your best today 🚀",
                        subTitle: "December 18,2023",
                        trailing: null,
                      ),
                      // GlobalSearchBarWidget(
                      //   height: 50.sp,
                      //   width: double.infinity,
                      //   margin: EdgeInsets.only(bottom: 10.sp),
                      // ),
                      GlobalCategoryListBarWidget(
                        list: categoryDummyList,
                        margin: EdgeInsets.only(bottom: 20.sp),
                        // fillSelectionColor: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  child: const GridViewProductsListWidget(),
                ),
              ],
            ),
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
                      resizeToAvoidBottomInset: false,
                      body: OrderCreateDetailsView(
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
