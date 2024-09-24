import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_category_list_bar_widget.dart';
import 'package:android_pos_ui/global_widgets/global_counter_widget.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/global_widgets/global_item_cart_widget.dart';
import 'package:android_pos_ui/global_widgets/global_item_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class PosDesktopTabView extends StatefulWidget {
  const PosDesktopTabView({super.key});

  @override
  State<PosDesktopTabView> createState() => _PosDesktopTabViewState();
}

class _PosDesktopTabViewState extends State<PosDesktopTabView> {
  int selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    final selectedList = itemsDummyList.where((e) => e.isSelected).toList();
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
                Expanded(
                    child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        itemsDummyList.length,
                        (index) => GlobalItemWidget(
                            model: itemsDummyList[index],
                            showCounter: false,
                            onItemSelected: () {
                              itemsDummyList[index].isSelected =
                                  !itemsDummyList[index].isSelected;
                              if (itemsDummyList[index].isSelected) {
                                itemsDummyList[index].itemCount = 1;
                              } else {
                                itemsDummyList[index].itemCount = 0;
                              }

                              setState(() {});
                            }),
                      )),
                ))
              ],
            ),
          ),
        ),
        Container(
          color: ThemeColors.primary.shade50,
          width: 340.w,
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalAppBarDeskTop(
                title: "William Defoe",
                subTitle: "#12132312",
                titleFontSize: 18.sp,
                subTitleFontSize: 14.sp,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GlobalCategoryListBarWidget(
                      list: [
                        Category("Dine in", null),
                        Category("Take away", null)
                      ],
                      showSmallWidget: true,
                    ),
                  ],
                ),
              ),
              Divider(height: 20.h, color: ThemeColors.secondary.shade200),
              _buildSectionTitle(text: "Where will you eat :"),
              GlobalCategoryListBarWidget(
                list: [
                  Category("Indoor", Icons.other_houses),
                  Category("Outdoor", Icons.camera_outdoor)
                ],
                showSmallWidget: true,
                expandItem: true,
              ),
              _buildSectionTitle(
                  text: "Your order :",
                  padding: EdgeInsets.only(bottom: 12.sp)),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedList.length,
                  itemBuilder: (context, index) => GlobalItemCartWidget(
                    model: selectedList[index],
                    onRemoveItem: () {
                      selectedList[index].isSelected = false;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSectionTitle(
      {required String text, EdgeInsetsGeometry padding = EdgeInsets.zero}) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: ThemeColors.secondary.shade400,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Row _buildSearchAndFilterButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 45.sp,
          margin: const EdgeInsetsDirectional.only(end: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: ThemeColors.secondary.shade200),
            color: ThemeColors.primary.shade50,
          ),
          child: StandardSearchBar(
            hintStyle: const TextStyle(height: 1),
            textStyle: const TextStyle(height: 1),
            width: 255.w,
            startIconColor: ThemeColors.secondary.shade500,
            shadow: const [],
            suggestions: const [
              'apple',
              'banana',
              'melon',
              'orange',
              'pineapple',
              'strawberry',
              'watermelon'
            ],
          ),
        ),
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
