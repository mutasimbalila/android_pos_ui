import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_date_time_picker.dart';
import 'package:android_pos_ui/global_widgets/global_dialog_app_bar.dart';
import 'package:android_pos_ui/global_widgets/global_drop_down_searchable.dart';
import 'package:android_pos_ui/global_widgets/global_product_cart_widget.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/tables/transaction/transaction_table.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TransactionEditDialog extends StatefulWidget {
  final TransactionDummy model;
  const TransactionEditDialog({super.key, required this.model});

  @override
  State<TransactionEditDialog> createState() => _TransactionEditDialogState();
}

class _TransactionEditDialogState extends State<TransactionEditDialog> {
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
                  width: 1000.sp,
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const GlobalDialogAppBar(title: "Edit Details"),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: SizedBox(
                          // height: 350.sp,
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 470.sp,
                                child: Column(
                                  children: [
                                    GlobalDropDownSearchable(
                                      title: "Order ID",
                                      list: ["#${widget.model.orderID}"],
                                      initialItem: "#${widget.model.orderID}",
                                      enabled: false,
                                    ),
                                    GlobalDropDownSearchable(
                                      title: "Receipt Number",
                                      list: [widget.model.receiptNo],
                                      initialItem: widget.model.receiptNo,
                                      enabled: false,
                                    ),
                                    const GlobalDropDownSearchable(
                                      title: "Collected/Cashier",
                                      list: ["Cashier Sirojudi"],
                                      initialItem: "Cashier Sirojudi",
                                    ),
                                    GlobalDateTimePicker(
                                      title: 'Date & Time',
                                      initialDate: DateTime.now(),
                                      onChanged: (p0) {},
                                    ),
                                    const GlobalDropDownSearchable(
                                      title: "Payment method",
                                      list: [
                                        "Credit Card",
                                        "Cash",
                                        "Mobile App"
                                      ],
                                      initialItem: "Cash",
                                      useStatusBox: true,
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(width: 20.sp),
                              SizedBox(
                                width: 450.sp,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      minVerticalPadding: 0,
                                      dense: true,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      visualDensity:
                                          const VisualDensity(vertical: -4),
                                      leading: Text("Orders",
                                          style: TextStyle(
                                            color: ThemeColors.secondary,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      trailing: Text("3 Items",
                                          style: TextStyle(
                                            color:
                                                ThemeColors.secondary.shade400,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300,
                                          )),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      // height: 180.sp,
                                      child: ListView.builder(
                                        itemCount: 3,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            GlobalProductCartWidget(
                                          model: itemsDummyList[index],
                                          onRemoveItem: () {},
                                          index: index,
                                        ),
                                      ),
                                    ),
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
          label: "Save",
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
}
