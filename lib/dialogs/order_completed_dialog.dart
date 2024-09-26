import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_invoice_total_item.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OrderCompletedDialog extends StatelessWidget {
  const OrderCompletedDialog({super.key});

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
                    borderRadius: BorderRadius.circular(14.r)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: SvgPicture.asset(
                          "assets/successful.svg",
                          width: 64.sp,
                        ),
                      ),
                      Text(
                        "Successfully placed an order",
                        style: TextStyle(
                          color: ThemeColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Text(
                          "\$34.99",
                          style: TextStyle(
                            color: ThemeColors.success,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: 350.sp,
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        // margin: EdgeInsets.symmetric(vertical: 10.sp),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ThemeColors.secondary.shade200),
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Column(
                          children: [
                            GlobalInvoiceTotalItem(
                              label: "Order ID",
                              value: "ORD212232",
                              valueStyle: _invoiceItemValue(),
                            ),
                            GlobalInvoiceTotalItem(
                              label: "Receipt Number",
                              value: "MW12131",
                              valueStyle: _invoiceItemValue(),
                            ),
                            GlobalInvoiceTotalItem(
                              label: "Date & Time",
                              value: "Augustus 23,2023 12.12am",
                              valueStyle: _invoiceItemValue(),
                            ),
                            GlobalInvoiceTotalItem(
                              label: "Payment method",
                              value: "Scan QR Code",
                              valueStyle: _invoiceItemValue(),
                            ),
                            GlobalInvoiceTotalItem(
                              label: "Collected by",
                              value: "Cashier Sirojudi",
                              valueStyle: _invoiceItemValue(),
                            ),
                          ],
                        ),
                      ),
                      GlobalButtonWidget(
                        label: "New Order",
                        onTap: () {},
                        width: 330.sp,
                        margin: EdgeInsets.only(top: 10.sp),
                      ),
                      GlobalButtonWidget(
                        label: "Print Receipt",
                        width: 330.sp,
                        icon: SvgPicture.asset("assets/printer_icon.svg"),
                        backgroundColor: ThemeColors.primary.shade50,
                        textColor: ThemeColors.secondary,
                        borderColor: ThemeColors.secondary.shade200,
                        onTap: () {},
                      ),
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

  TextStyle _invoiceItemValue() {
    return TextStyle(
      color: ThemeColors.secondary,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }
}
