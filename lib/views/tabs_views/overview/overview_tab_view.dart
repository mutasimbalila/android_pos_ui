import 'package:android_pos_ui/global_widgets/global_app_bar_button_item_widget.dart';
import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_search_bar_widget.dart';
import 'package:android_pos_ui/global_widgets/global_total_widget.dart';
import 'package:android_pos_ui/tables/transaction/transaction_table.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OverviewTabView extends StatefulWidget {
  const OverviewTabView({super.key});

  @override
  State<OverviewTabView> createState() => _OverviewTabViewState();
}

class _OverviewTabViewState extends State<OverviewTabView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            children: [
              GlobalAppBarDeskTop(
                title: "Overview",
                subTitle: "December 18,2023",
                horizontalTitleAndSub: sizingInfo.isMobile,
                trailing: null,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.sp),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 12.sp,
                    children: const [
                      GlobalTotalWidget(
                        title: "Total Sales",
                        value: "\$121,412",
                        svgIcon: "total_sales_icon.svg",
                      ),
                      GlobalTotalWidget(
                        title: "Total Sales",
                        value: "4,324",
                        svgIcon: "total_customers_icons.svg",
                      ),
                      GlobalTotalWidget(
                        title: "Total Order",
                        value: "5,021",
                        svgIcon: "total_order_icons.svg",
                      ),
                      GlobalTotalWidget(
                        title: "Total Tip",
                        value: "\$1,412",
                        svgIcon: "total_tip_icons.svg",
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            3.sp, 0, 3.sp, 13.sp),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Recent Transaction",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp,
                              color: ThemeColors.secondary,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const GlobalSearchBarWidget(),
                              GlobalAppBarButtonItemWidget(
                                svgIcon: "assets/filter_icon.svg",
                                onTap: () {},
                                size: 45.sp,
                                margin: EdgeInsetsDirectional.zero,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        child: TransactionTable(),
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
