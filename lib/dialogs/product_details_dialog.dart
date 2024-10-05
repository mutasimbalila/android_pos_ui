import 'package:android_pos_ui/dialogs/add_or_update_product_dialog.dart';
import 'package:android_pos_ui/dialogs/delete_confirm_dialog.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_dialog_app_bar.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/global_widgets/global_invoice_total_item.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductDetailsDialog extends StatelessWidget {
  final ItemModel model;
  const ProductDetailsDialog({super.key, required this.model});

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
                      const GlobalDialogAppBar(title: "Products Details"),
                      SizedBox(
                        height: 250.sp,
                        child: Wrap(
                          children: [
                            SizedBox(
                              width: 370.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GlobalInvoiceTotalItem(
                                    label: "Product Name",
                                    value: model.name,
                                  ),
                                  const GlobalInvoiceTotalItem(
                                    label: "Receipt Number",
                                    value: "MW12131",
                                  ),
                                  const GlobalInvoiceTotalItem(
                                    label: "Input Tax",
                                    value: "2%",
                                  ),
                                  GlobalInvoiceTotalItem(
                                    label: "Category product",
                                    value: "",
                                    valueWidget: tableCellColoredStatusItem(
                                        "Mie/Ramens", 100.sp),
                                  ),
                                  const GlobalInvoiceTotalItem(
                                    label: "Discount",
                                    value: "50%",
                                  ),
                                  const GlobalInvoiceTotalItem(
                                    label: "Collected/Cashier",
                                    value: "\$12.00",
                                  ),
                                  const GlobalInvoiceTotalItem(
                                    label: "Stock",
                                    value: "50",
                                  ),
                                ],
                              ),
                            ),
                            // _buildDividerHezOrVer(sizingInfo),
                            SizedBox(
                              width: 350.w,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 8, 8),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 230.h,
                                      width: double.infinity,
                                      child:
                                          globalCashedImageNetworkWithLoading(
                                        itemsDummyList[0].imageUrl,
                                        fit: BoxFit.cover,
                                        radius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(height: 20.sp),
                      _buildButtonSection(context)
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

  Row _buildButtonSection(BuildContext context) {
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
          onTap: () {
            Nav.pop(context);
            Nav.showDialogs(context, const AddOrUpdateProductDialog());
          },
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
          onTap: () {
            Nav.showDialogs(
                context,
                DeleteConfirmDialog(
                  deletedInfo: model.name,
                ));
          },
        )
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
