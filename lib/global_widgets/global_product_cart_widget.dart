import 'package:android_pos_ui/global_widgets/global_counter_widget.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GlobalProductCartWidget extends StatefulWidget {
  final ItemModel model;
  final int index;
  final Function() onRemoveItem;
  final bool showImage;
  const GlobalProductCartWidget(
      {super.key,
      required this.model,
      required this.onRemoveItem,
      this.showImage = true,
      required this.index});

  @override
  State<GlobalProductCartWidget> createState() =>
      _GlobalProductCartWidgetState();
}

class _GlobalProductCartWidgetState extends State<GlobalProductCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.sp),
      height: widget.showImage ? 80.sp : null,
      margin: EdgeInsetsDirectional.only(bottom: 10.w),
      decoration: BoxDecoration(
        color: ThemeColors.primary.shade50,
        border: Border.all(color: ThemeColors.secondary.shade100),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: widget.showImage
          ? _buildItemCardWithImageForm()
          : _buildItemCartSmallForm(),
    );
  }

  Row _buildItemCartSmallForm() {
    return Row(
      children: [
        Container(
          width: 20.sp,
          height: 20.sp,
          margin: EdgeInsetsDirectional.only(end: 7.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ThemeColors.secondary.shade300,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            (widget.index + 1).toString(),
            style: TextStyle(
              fontSize: 12.sp,
              color: ThemeColors.primary.shade50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: _buildNameItemCart(
              "${widget.model.name} (${widget.model.itemCount})",
              TextStyle(
                fontSize: 14.sp,
                color: ThemeColors.secondary,
              )),
        ),
        _buildPriceWidget(TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: ThemeColors.secondary,
        )),
      ],
    );
  }

  Row _buildItemCardWithImageForm() {
    return Row(
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
                  _buildNameItemCart(
                    widget.model.name,
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
                  _buildPriceWidget(),

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
    );
  }

  Text _buildPriceWidget([TextStyle? style]) {
    return Text(
      "\$${widget.model.price}",
      style: style ??
          TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: ThemeColors.secondary.shade400,
          ),
    );
  }

  Text _buildNameItemCart(String name, [TextStyle? style]) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style ??
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: ThemeColors.secondary,
          ),
    );
  }
}
