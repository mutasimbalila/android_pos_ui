import 'package:android_pos_ui/dialogs/add_or_update_product_dialog.dart';
import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_table_title_search_bar.dart';
import 'package:android_pos_ui/global_widgets/global_total_widget.dart';
import 'package:android_pos_ui/tables/products/products_table.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductsTabView extends StatefulWidget {
  const ProductsTabView({super.key});

  @override
  State<ProductsTabView> createState() => _ProductsTabViewState();
}

class _ProductsTabViewState extends State<ProductsTabView> {
  final GlobalKey<SfDataGridState> productsKey = GlobalKey<SfDataGridState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    GlobalAppBarDeskTop(
                      title: "Products",
                      subTitle: "Let’s Manage your products",
                      width: 200.sp,
                      horizontalTitleAndSub: sizingInfo.isMobile,
                      trailing: null,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GlobalButtonWidget(
                          label: "Add new product",
                          width: sizingInfo.isMobile ? null : 180.w,
                          iconAlignment: IconAlignment.end,
                          icon: SvgPicture.asset("assets/add_icon.svg"),
                          onTap: () async {
                            Nav.showDialogs(
                                context, const AddOrUpdateProductDialog());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.sp),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 12.sp,
                    children: [
                      GlobalTotalWidget(
                        title: "Total Products",
                        value: "\$121,412",
                        svgIcon: "total_products_icon.svg",
                        width: 368.5.w,
                      ),
                      GlobalTotalWidget(
                        title: "Total Category Product",
                        value: "4,324",
                        svgIcon: "total_category_product_icons.svg",
                        width: 368.5.w,
                      ),
                      GlobalTotalWidget(
                        title: "Purchase Invoice",
                        value: "5,021",
                        svgIcon: "purchase_invoice_icon.svg",
                        width: 368.5.w,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                  margin: EdgeInsetsDirectional.only(bottom: 10.w),
                  decoration: BoxDecoration(
                    color: ThemeColors.primary.shade50,
                    border: Border.all(color: ThemeColors.secondary.shade200),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Column(
                    children: [
                      const GlobalTableTitleAndSearchBar(
                        title: "Products List",
                      ),
                      Expanded(
                        child: ProductsTable(tableKey: productsKey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
