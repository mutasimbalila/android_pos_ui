import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_dialog_app_bar.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/global_widgets/global_invoice_total_item.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/tables/transaction/transaction_table.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TransactionDetailsDialog extends StatelessWidget {
  final TransactionDummy model;
  const TransactionDetailsDialog({
    super.key,
    required this.model,
  });

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
                  width: 750.sp,
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const GlobalDialogAppBar(title: "Details Transactions"),
                      SizedBox(
                        height: 230.sp,
                        child: Wrap(
                          children: [
                            _buildOrderDetailsInformation(),
                            _buildDividerHezOrVer(sizingInfo),
                            _buildOrderProductsItems()
                          ],
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
          label: "Print",
          width: 140.w,
          iconAlignment: IconAlignment.end,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          icon: SvgPicture.asset(
            "assets/printer_icon.svg",
            width: 16.sp,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onTap: () {},
        ),
        GlobalButtonWidget(
          label: "Edit",
          width: 100.w,
          backgroundColor: ThemeColors.primary.shade50,
          textColor: ThemeColors.secondary,
          borderColor: ThemeColors.secondary.shade200,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          icon: SvgPicture.asset(
            "assets/edit_icon.svg",
            width: 16.sp,
            colorFilter: ColorFilter.mode(
              ThemeColors.secondary,
              BlendMode.srcIn,
            ),
          ),
          onTap: () {},
        ),
        GlobalButtonWidget(
          label: "Delete",
          width: 100.w,
          backgroundColor: ThemeColors.primary.shade50,
          textColor: ThemeColors.error,
          borderColor: ThemeColors.secondary.shade200,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          icon: SvgPicture.asset(
            "assets/delete_icon.svg",
            width: 16.sp,
            colorFilter: ColorFilter.mode(
              ThemeColors.error,
              BlendMode.srcIn,
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }

  SizedBox _buildDividerHezOrVer(SizingInformation sizingInfo) {
    return SizedBox(
      height: sizingInfo.isMobile ? null : 220.sp,
      child: sizingInfo.isMobile ? const Divider() : const VerticalDivider(),
    );
  }

  SizedBox _buildOrderProductsItems() {
    return SizedBox(
      width: 350.w,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
        child: Column(
          children: [
            ListTile(
              minVerticalPadding: 0,
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
              visualDensity: const VisualDensity(vertical: -4),
              leading: Text("Orders",
                  style: TextStyle(
                    color: ThemeColors.secondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Text("3 Items",
                  style: TextStyle(
                    color: ThemeColors.secondary.shade400,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  )),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180.sp,
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsetsDirectional.only(bottom: 10.w),
                  decoration: BoxDecoration(
                    color: ThemeColors.primary.shade50,
                    border: Border.all(color: ThemeColors.secondary.shade100),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 7.w),
                    leading: SizedBox(
                      height: 40.sp,
                      width: 40.sp,
                      child: globalCashedImageNetworkWithLoading(
                        itemsDummyList[index].imageUrl,
                        fit: BoxFit.cover,
                        radius: BorderRadius.circular(8.r),
                      ),
                    ),
                    title: Text(
                      "${itemsDummyList[index].name} (${itemsDummyList[index].itemCount})",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.secondary,
                      ),
                    ),
                    trailing: Text(
                      "\$${itemsDummyList[index].price}",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.secondary.shade400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildOrderDetailsInformation() {
    return SizedBox(
      width: 350.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GlobalInvoiceTotalItem(
            label: "Order ID",
            value: "#${model.orderID}",
          ),
          GlobalInvoiceTotalItem(
            label: "Receipt Number",
            value: model.receiptNo,
          ),
          GlobalInvoiceTotalItem(
            label: "Date & Time",
            value: model.dateTime,
          ),
          GlobalInvoiceTotalItem(
            label: "Payment method",
            value: "",
            valueWidget:
                tableCellColoredStatusItem(model.paymentMethod, 100.sp),
          ),
          const GlobalInvoiceTotalItem(
            label: "Collected by",
            value: "Cashier Sirojudi",
          ),
        ],
      ),
    );
  }
}
