import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_category_list_bar_widget.dart';
import 'package:android_pos_ui/global_widgets/global_item_cart_widget.dart';
import 'package:android_pos_ui/global_widgets/global_item_widget.dart';
import 'package:android_pos_ui/global_widgets/global_payment_method_bar_widget.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsView extends StatefulWidget {
  final List<ItemModel> itemsDummyList;
  final Function(int) onUnSelect;
  const OrderDetailsView(
      {super.key, required this.itemsDummyList, required this.onUnSelect});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    final selectedList =
        widget.itemsDummyList.where((e) => e.isSelected).toList();

    return SafeArea(
      child: Container(
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
            _buildSectionTitle(
              text: "Where will you eat :",
              padding: EdgeInsets.zero,
            ),
            GlobalCategoryListBarWidget(
              list: [
                Category("Indoor", Icons.other_houses),
                Category("Outdoor", Icons.camera_outdoor)
              ],
              showSmallWidget: true,
              expandItem: true,
            ),
            _buildSectionTitle(text: "Your order :"),
            Expanded(
              child: ListView.builder(
                itemCount: selectedList.length,
                itemBuilder: (context, index) => GlobalItemCartWidget(
                  model: selectedList[index],
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
                  _buildInvoiceTotalItem(
                    label: "Subtotal (2)",
                    value: "\$32.99",
                  ),
                  _buildInvoiceTotalItem(
                    label: "Service Tax",
                    value: "\$2.00",
                  ),
                  Divider(color: ThemeColors.secondary.shade200),
                  _buildInvoiceTotalItem(
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
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  ListTile _buildInvoiceTotalItem({
    required String label,
    required String value,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
  }) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4, horizontal: 0),
      minVerticalPadding: 0,
      dense: true,
      title: Text(
        label,
        style: labelStyle ??
            TextStyle(
              color: ThemeColors.secondary.shade400,
              fontSize: 14.sp,
            ),
      ),
      trailing: Text(
        value,
        style: valueStyle ??
            TextStyle(
                color: ThemeColors.secondary,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp),
      ),
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
