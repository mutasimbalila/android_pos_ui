import 'dart:math';

import 'package:android_pos_ui/global_widgets/global_counter_widget.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalProductWidget extends StatefulWidget {
  final ItemModel model;
  final bool showCounter;
  final Function() onItemSelected;
  const GlobalProductWidget({
    super.key,
    required this.onItemSelected,
    // required this.isSelected,
    required this.model,
    required this.showCounter,
  });

  @override
  State<GlobalProductWidget> createState() => _GlobalProductWidgetState();
}

class _GlobalProductWidgetState extends State<GlobalProductWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInfo) {
        return Container(
          width: 165.sp,
          // height: 180.sp,
          // margin: EdgeInsetsDirectional.only(end: 10.w),
          decoration: BoxDecoration(
            color: ThemeColors.primary.shade50,
            border: Border.all(
                color: widget.model.isSelected
                    ? ThemeColors.primary
                    : ThemeColors.secondary.shade100,
                width: widget.model.isSelected ? 2.0 : 1),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Material(
            elevation: widget.model.isSelected ? 10 : 0,
            shadowColor: ThemeColors.primary,
            borderRadius: BorderRadius.circular(7.r),
            child: InkWell(
              onTap: () {
                widget.onItemSelected();
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SizedBox(
                        height: 150.sp,
                        width: double.infinity,
                        child: globalCashedImageNetworkWithLoading(
                          widget.model.imageUrl,
                          fit: BoxFit.cover,
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                            topRight: Radius.circular(5.r),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: ThemeColors.secondary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${widget.model.price}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ThemeColors.secondary.shade400,
                                ),
                              ),
                              Text(
                                widget.model.offer,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.error,
                                ),
                              ),
                            ],
                          ),
                          if (widget.showCounter || sizingInfo.isMobile)
                            GlobalCounterWidget(
                              value: widget.model.itemCount,
                              onResult: (inc) {
                                widget.model.itemCount = inc;
                                setState(() {});
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

final itemsDummyList = [
  ItemModel("Indomie with cheeze"),
  ItemModel("Healthy Salad Avocado"),
  ItemModel("Tsnami Salmon"),
  ItemModel("Induomie Seafood"),
  ItemModel("Salmon Coco Sauce"),
  ItemModel("Smooky Beef "),
  ItemModel("Tropical Smoothies"),
  ItemModel("Indomie Soto"),
  ItemModel("Japanese Rice Bowl"),
  ItemModel("Kimchi Rice"),
  ItemModel("Tsumani Beef Egg"),
];

class ItemModel {
  final String name;
  int itemCount = 0;
  bool isSelected = false;
  final String price = "${Random().nextInt(99) + 5}.00";
  final String imageUrl =
      "https://foodish-api.com/images/pizza/pizza${Random().nextInt(99)}.jpg";
  final int offerValue =
      (Random().nextInt(8) + 3) % 8 == 0 ? Random().nextInt(50) : 0;
  late final String offer = offerValue == 0 && offerValue < 10
      ? ""
      : "${offerValue - (offerValue % 10)}% Off";

  ItemModel(this.name);
}
