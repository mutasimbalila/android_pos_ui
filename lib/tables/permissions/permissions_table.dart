import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/tables/permissions/permissions_data_source.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

int rowsPerPage = 10;

const double _dataPagerHeight = 60.0;

List<UserModel> paginatedList = [];

class PermissionsTable extends StatefulWidget {
  //this key used for exporting table to pdf or excel
  final GlobalKey<SfDataGridState> tableKey;
  const PermissionsTable({super.key, required this.tableKey});

  @override
  State<PermissionsTable> createState() => _TransactionTableState();
}

class _TransactionTableState extends State<PermissionsTable> {
  late final _dataSource =
      PermissionsDataSource(onActionsTapped: _tableActions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfDataGridTheme(
            data: SfDataGridThemeData(
              headerColor: ThemeColors.tableHeaderColor,
              currentCellStyle: DataGridCurrentCellStyle(
                borderWidth: 0,
                borderColor: ThemeColors.secondary.shade100,
              ),
              selectionColor: ThemeColors.primary.shade200,
            ),
            child: SfDataGrid(
              key: widget.tableKey,
              source: _dataSource,
              gridLinesVisibility: GridLinesVisibility.none,
              headerGridLinesVisibility: GridLinesVisibility.none,
              selectionMode: SelectionMode.multiple,
              allowSorting: true,
              allowFiltering: true,
              showColumnHeaderIconOnHover: true,
              showCheckboxColumn: true,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
                side: BorderSide(color: ThemeColors.secondary.shade200),
              ),
              checkboxColumnSettings: const DataGridCheckboxColumnSettings(
                  // width: 30.sp,
                  ),
              columns: [
                tableHeaderColumn(
                  columnName: "No",
                  label: "No",
                  width: 60.sp,
                ),
                tableHeaderColumn(
                  columnName: "Name",
                  label: "Name",
                  columnWidthMode: ColumnWidthMode.fill,
                ),
                tableHeaderColumn(
                  columnName: "Email Address",
                  label: "Email Address",
                  width: 260.sp,
                ),
                // tableHeaderColumn(
                //   columnName: "Created Date",
                //   label: "Created Date",
                //   width: 100.sp,
                // ),
                tableHeaderColumn(
                  columnName: "Role",
                  label: "Role",
                  width: 100.sp,
                ),
                tableHeaderColumn(
                  columnName: "Action",
                  label: "Action",
                  width: 110.sp,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            height: _dataPagerHeight,
            width: double.infinity,
            child: SfDataPagerTheme(
              data: SfDataPagerThemeData(
                // itemBorderColor: const Color(0xffF1F2F4),
                // itemBorderWidth: 1,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.grey.shade100,
                itemBorderRadius: BorderRadius.circular(8),
                selectedItemTextStyle: TextStyle(
                  color: Colors.black87.withOpacity(0.7),
                  // fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: SfDataPager(
                delegate: _dataSource,
                // previousPageItemVisible: false,
                // nextPageItemVisible: false,
                visibleItemsCount: 3,

                itemPadding: const EdgeInsets.all(8),
                availableRowsPerPage: const [10, 20, 30],
                onRowsPerPageChanged: (int? rowsPerPage) {
                  setState(() {
                    rowsPerPage = rowsPerPage!;
                    _dataSource.updateDataGriDataSource();
                  });
                },
                pageCount:
                    ((itemsDummyList.length / rowsPerPage).ceil()).toDouble(),
              ),
            )),
      ],
    );
  }

  _tableActions(UserModel model, ActionType action) {
    if (action == ActionType.view) {
      // Nav.showDialogs(context, ProductDetailsDialog(model: model));
    } else if (action == ActionType.edit) {
      // Nav.showDialogs(context, const AddOrUpdateProductDialog(isUpdate: true));
    } else if (action == ActionType.delete) {
      // Nav.showDialogs(context, DeleteConfirmDialog(deletedInfo: model.name));
    }
  }
}
