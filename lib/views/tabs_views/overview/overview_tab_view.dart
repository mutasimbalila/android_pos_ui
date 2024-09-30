import 'package:android_pos_ui/dialogs/export_dialog.dart';
import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/global_widgets/global_table_title_search_bar.dart';
import 'package:android_pos_ui/global_widgets/global_total_widget.dart';
import 'package:android_pos_ui/tables/transaction/transaction_table.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/tabs_views/overview/widget/drop_down_duration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OverviewTabView extends StatefulWidget {
  const OverviewTabView({super.key});

  @override
  State<OverviewTabView> createState() => _OverviewTabViewState();
}

class _OverviewTabViewState extends State<OverviewTabView> {
  final GlobalKey<SfDataGridState> transactionKey =
      GlobalKey<SfDataGridState>();

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
                      title: "Overview",
                      subTitle: "December 18,2023",
                      width: 200.sp,
                      horizontalTitleAndSub: sizingInfo.isMobile,
                      trailing: null,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GlobalButtonWidget(
                          label: "Export",
                          width: sizingInfo.isMobile ? null : 135.w,
                          margin: EdgeInsetsDirectional.only(end: 10.w),
                          iconAlignment: IconAlignment.end,
                          icon: SvgPicture.asset("assets/export_icon.svg"),
                          onTap: () async {
                            Nav.showDialogs(context, const ExportDialog());
                            // TableExportController.toExcel(
                            //   tableKey: transactionKey,
                            //   fileName: "Transactions",
                            // );
                          },
                        ),
                        DropDownDurationWidget(
                          width: sizingInfo.isMobile ? null : 135.w,
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
                      const GlobalTableTitleAndSearchBar(
                        title: "Recent Transaction",
                      ),
                      Expanded(
                        child: TransactionTable(
                          tableKey: transactionKey,
                        ),
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
