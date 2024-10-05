import 'package:android_pos_ui/dialogs/order_completed_dialog.dart';
import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_invoice_total_item.dart';
import 'package:android_pos_ui/global_widgets/global_product_cart_widget.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/global_widgets/global_payment_method_bar_widget.dart';
import 'package:android_pos_ui/global_widgets/global_text_filed_custom_widget.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OrderCreateDetailsView extends StatefulWidget {
  final List<ItemModel> itemsDummyList;
  final Function(int) onUnSelect;
  const OrderCreateDetailsView(
      {super.key, required this.itemsDummyList, required this.onUnSelect});

  @override
  State<OrderCreateDetailsView> createState() => _OrderCreateDetailsViewState();
}

class _OrderCreateDetailsViewState extends State<OrderCreateDetailsView> {
  final customerController = TextEditingController(text: "William Defoe");

  @override
  Widget build(BuildContext context) {
    final selectedList =
        widget.itemsDummyList.where((e) => !e.isSelected).toList();

    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInfo) {
        return Container(
          color: ThemeColors.primary.shade50,
          width: sizingInfo.isMobile ? null : 440.w,
          padding: EdgeInsetsDirectional.fromSTEB(15.sp, 5.sp, 15.sp, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizingInfo.isMobile
                  ? _buildMobileAppBar(context)
                  : _buildDeskTopAppBar(),

              GlobalTextFiledCustomWidget(
                label: "Customer Name",
                hint: "Customer Name",
                controller: customerController,
                prefixIcon: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset("assets/person_icon.svg")),
              ),
              // _buildSectionTitle(
              //   text: "Where will you eat :",
              //   padding: EdgeInsets.zero,
              // ),
              // GlobalCategoryListBarWidget(
              //   list: [
              //     Category("Indoor", Icons.other_houses),
              //     Category("Outdoor", Icons.camera_outdoor)
              //   ],
              //   showSmallWidget: true,
              //   expandItem: true,
              // ),
              _buildSectionTitle(text: "Your order :"),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedList.length,
                  itemBuilder: (context, index) =>
                      GlobalProductCartWidget(
                    model: selectedList[index],
                    index: index,
                    showImage: false,
                    onRemoveItem: () {
                      final idx =
                          widget.itemsDummyList.indexOf(selectedList[index]);
                      widget.onUnSelect(idx);
                      setState(() {});
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.secondary.shade200),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Column(
                  children: [
                    const GlobalInvoiceTotalItem(
                      label: "Subtotal (2)",
                      value: "\$32.99",
                    ),
                    const GlobalInvoiceTotalItem(
                      label: "Service Tax",
                      value: "\$2.00",
                    ),
                    Divider(color: ThemeColors.secondary.shade200),
                    GlobalInvoiceTotalItem(
                      label: "Total payment",
                      value: "\$34.99",
                      labelStyle: TextStyle(
                        color: ThemeColors.secondary,
                        fontSize: 14.sp,
                      ),
                      valueStyle: TextStyle(
                        color: ThemeColors.secondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _buildSectionTitle(text: "Payment method:"),
              const GlobalPaymentMethodBar(),
              GlobalButtonWidget(
                label: "Make Order",
                onTap: () {
                  Nav.showDialogs(context, const OrderCompletedDialog());
                },
              )
            ],
          ),
        );
      },
    );
  }

  Column _buildDeskTopAppBar() {
    return Column(
      children: [
        GlobalAppBarDeskTop(
          title: "Current Order",
          subTitle: "#12132312",
          titleFontSize: 18.sp,
          subTitleFontSize: 14.sp,
          margin: EdgeInsetsDirectional.zero,
          trailing: GlobalAppBarButtonItemWidget(
            svgIcon: "assets/setting_icons_2.svg",
            onTap: () {},
            size: 45.sp,
            margin: EdgeInsetsDirectional.zero,
          ),
        ),
        Divider(height: 20.h, color: ThemeColors.secondary.shade200),
      ],
    );
  }

  AppBar _buildMobileAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ThemeColors.primary.shade50,
      centerTitle: true,
      leading: Row(
        children: [
          GlobalAppBarButtonItemWidget(
            svgIcon: "assets/arrow_left_back.svg",
            margin: EdgeInsetsDirectional.zero,
            size: 45.sp,
            onTap: () {
              Nav.pop(context);
            },
          ),
        ],
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Current Order",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: ThemeColors.secondary,
            ),
          ),
          Text(
            "#12132312",
            style: TextStyle(
              fontSize: 12.sp,
              color: ThemeColors.secondary.shade400,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            GlobalAppBarButtonItemWidget(
              svgIcon: "assets/setting_icons_2.svg",
              onTap: () {},
              size: 45.sp,
              margin: EdgeInsetsDirectional.zero,

              // margin: EdgeInsetsDirectional.only(end: 5.w),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(
      {required String text, EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 12.sp),
      child: Text(
        text,
        style: TextStyle(
          color: ThemeColors.secondary.shade400,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
