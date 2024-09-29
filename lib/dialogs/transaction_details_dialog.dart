import 'package:android_pos_ui/global_widgets/global_dialog_app_bar.dart';
import 'package:android_pos_ui/global_widgets/global_invoice_total_item.dart';
import 'package:android_pos_ui/global_widgets/global_product_cart_widget.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/tables/transaction/transaction_table.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    borderRadius: BorderRadius.circular(14.r)),
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
                        height: 180.sp,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
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
                                    valueWidget: tableCellColoredStatusItem(
                                        model.paymentMethod, 100.sp),
                                  ),
                                  const GlobalInvoiceTotalItem(
                                    label: "Collected by",
                                    value: "Cashier Sirojudi",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 200.sp, child: const VerticalDivider()),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  end: 30.w, start: 15.w),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Menu Order",
                                          style: TextStyle(
                                            color: ThemeColors.secondary,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      const Text("3 Items"),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: 3,
                                      itemBuilder: (context, index) =>
                                          GlobalProductCartWidget(
                                        model: itemsDummyList[index],
                                        index: index,
                                        showImage: false,
                                        onRemoveItem: () {
                                          // final idx =
                                          //     widget.itemsDummyList.indexOf(selectedList[index]);
                                          // widget.onUnSelect(idx);
                                          // setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      Divider(height: 40.sp),
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
}
