import 'package:android_pos_ui/global_widgets/global_counter_widget.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/global_widgets/global_item_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GlobalItemCartWidget extends StatefulWidget {
  final ItemModel model;
  final Function() onRemoveItem;
  const GlobalItemCartWidget(
      {super.key, required this.model, required this.onRemoveItem});

  @override
  State<GlobalItemCartWidget> createState() => _GlobalItemCartWidgetState();
}

class _GlobalItemCartWidgetState extends State<GlobalItemCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.sp),
      height: 80.sp,
      margin: EdgeInsetsDirectional.only(bottom: 10.w),
      decoration: BoxDecoration(
        color: ThemeColors.primary.shade50,
        border: Border.all(color: ThemeColors.secondary.shade100),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 60.sp,
            width: 60.sp,
            child: globalCashedImageNetworkWithLoading(
              widget.model.imageUrl,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(8.r),
            ),
          ),
          SizedBox(width: 10.sp),
          Expanded(
            // flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    InkWell(
                      onTap: () {
                        widget.onRemoveItem();
                      },
                      child: Material(
                        child: SizedBox(
                          height: 20.sp,
                          width: 20.sp,
                          child: SvgPicture.asset("assets/remove_icon.svg"),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlobalCounterWidget(
                      value: widget.model.itemCount,
                      onResult: (value) {
                        widget.model.itemCount = value;
                        if (value == 0) {
                          widget.onRemoveItem();
                        }
                        setState(() {});
                      },
                    ),
                    Text(
                      "\$${widget.model.price}",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.secondary.shade400,
                      ),
                    ),

                    // Text(
                    //   widget.model.offer,
                    //   style: TextStyle(
                    //     fontSize: 12.sp,
                    //     fontWeight: FontWeight.bold,
                    //     color: ThemeColors.error,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //       horizontal: 7, vertical: 7),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const SizedBox(height: 5),

          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
