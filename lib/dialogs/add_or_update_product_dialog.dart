import 'dart:math';

import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_dialog_app_bar.dart';
import 'package:android_pos_ui/global_widgets/global_drop_down_searchable.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/global_widgets/global_text_filed_horizontal_and_vertical_label.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddOrUpdateProductDialog extends StatefulWidget {
  final bool isUpdate;
  //only for test
  const AddOrUpdateProductDialog({super.key, this.isUpdate = false});

  @override
  State<AddOrUpdateProductDialog> createState() =>
      _AddOrUpdateProductDialogState();
}

class _AddOrUpdateProductDialogState extends State<AddOrUpdateProductDialog> {
  final _productNameController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _stockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Dialog(
                backgroundColor: ThemeColors.primary.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: 1020.sp,
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const GlobalDialogAppBar(title: "Add new product"),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: SizedBox(
                          height: 370.sp,
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 470.sp,
                                child: Column(
                                  children: [
                                    GlobalTextFiledHorizontalAndVerticalLabel(
                                      label: "Product Name",
                                      hint: "Product Name",
                                      controller: _productNameController,
                                    ),
                                    const GlobalDropDownSearchable(
                                      title: "Receipt Number",
                                      list: ["MW12131"],
                                      initialItem: "MW12131",
                                      enabled: false,
                                    ),
                                    const GlobalDropDownSearchable(
                                      title: "Category product",
                                      list: ["Mie/Ramen", "Salad", "Seafood"],
                                      initialItem: "Mie/Ramen",
                                      useStatusBox: true,
                                    ),
                                    const GlobalDropDownSearchable(
                                      title: "Input Tax",
                                      list: ["1%", "2%", "3%", "4%", "5%"],
                                      initialItem: "4%",
                                    ),
                                    const GlobalDropDownSearchable(
                                      title: "Discount",
                                      list: ["10%", "20%", "30%", "40%", "50%"],
                                      initialItem: "50%",
                                    ),
                                  ],
                                ),
                              ),
                              _buildDividerHezOrVer(sizingInfo),
                              SizedBox(
                                width: 450.sp,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GlobalTextFiledHorizontalAndVerticalLabel(
                                      label: "Collected/Cashier",
                                      hint: "Collected/Cashier",
                                      controller: _sellingPriceController,
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SvgPicture.asset(
                                            "assets/dollar_circle_icon.svg"),
                                      ),
                                    ),
                                    GlobalTextFiledHorizontalAndVerticalLabel(
                                      label: "Stock",
                                      hint: "Stock",
                                      controller: _stockController,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Product Image",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color:
                                                ThemeColors.secondary.shade400,
                                          ),
                                        ),
                                        Container(
                                          height: 120.h,
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors
                                                      .secondary.shade100),
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/upload_icon.svg"),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "Browse to upload product image",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // height: 40.h,
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7.w),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeColors
                                                      .secondary.shade100),
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 10.w,
                                            leading: SizedBox(
                                              height: 37.sp,
                                              width: 37.sp,
                                              child:
                                                  globalCashedImageNetworkWithLoading(
                                                "https://foodish-api.com/images/pizza/pizza${Random().nextInt(99)}.jpg",
                                                fit: BoxFit.cover,
                                                showNotFoundImage: false,
                                                radius: BorderRadius.circular(
                                                    100.r),
                                              ),
                                            ),
                                            title: Text(
                                              "Indomie Photo.img",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.sp),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "5.10mb",
                                                  style: TextStyle(
                                                      color: ThemeColors
                                                          .secondary.shade400),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: SvgPicture.asset(
                                                      "assets/delete_icon.svg",
                                                      width: 20.sp,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              ThemeColors.error,
                                                              BlendMode.srcIn),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 20.sp),
                      _buildButtonSection()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row _buildButtonSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GlobalButtonWidget(
          label: widget.isUpdate ? "Update" : "Add product",
          width: 140.w,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          onTap: () {},
        ),
        GlobalButtonWidget(
          label: "Cancel",
          width: 140.w,
          backgroundColor: ThemeColors.primary.shade50,
          textColor: ThemeColors.secondary,
          borderColor: ThemeColors.secondary.shade200,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          onTap: () {
            Nav.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildDividerHezOrVer(SizingInformation sizingInfo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: sizingInfo.isMobile ? null : 350.sp,
        child: sizingInfo.isMobile ? const Divider() : const VerticalDivider(),
      ),
    );
  }
}
