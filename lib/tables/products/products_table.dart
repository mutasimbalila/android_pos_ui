import 'package:android_pos_ui/dialogs/add_or_update_product_dialog.dart';
import 'package:android_pos_ui/dialogs/delete_confirm_dialog.dart';
import 'package:android_pos_ui/dialogs/product_details_dialog.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/tables/products/products_data_source.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

int rowsPerPage = 10;

const double _dataPagerHeight = 60.0;

List<ItemModel> paginatedProducts = [];

class ProductsTable extends StatefulWidget {
  //this key used for exporting table to pdf or excel
  final GlobalKey<SfDataGridState> tableKey;
  const ProductsTable({super.key, required this.tableKey});

  @override
  State<ProductsTable> createState() => _TransactionTableState();
}

class _TransactionTableState extends State<ProductsTable> {
  late final _dataSource = ProductsDataSource(onActionsTapped: _tableActions);

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
              // selectionColor: ThemeColors.primary.shade200,
            ),
            child: SfDataGrid(
              key: widget.tableKey,
              source: _dataSource,
              // showCheckboxColumn: true,

              gridLinesVisibility: GridLinesVisibility.none,
              headerGridLinesVisibility: GridLinesVisibility.none,

              selectionMode: SelectionMode.single,
              allowSorting: true,
              allowFiltering: true,
              showColumnHeaderIconOnHover: true,

              // showCheckboxColumn: true,
              // allowFiltering: true,
              // checkboxShape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.r),
              //   side: BorderSide(color: ThemeColors.secondary.shade200),
              // ),

              // checkboxColumnSettings:
              //     const DataGridCheckboxColumnSettings(
              //         // width: 30.sp,
              //         ),
              columns: [
                tableHeaderColumn(
                  columnName: "Product name",
                  label: "Product name",
                  columnWidthMode: ColumnWidthMode.fill,
                ),
                tableHeaderColumn(
                  columnName: "Order/day",
                  label: "Order/day",
                  width: 110.sp,
                ),
                tableHeaderColumn(
                  columnName: "Category",
                  label: "Category",
                  width: 130.sp,
                ),
                tableHeaderColumn(
                  columnName: "Price/unit",
                  label: "Price/unit",
                  width: 110.sp,
                ),
                tableHeaderColumn(
                  columnName: "Stock",
                  label: "Stock",
                  width: 110.sp,
                ),
                tableHeaderColumn(
                  columnName: "Tax",
                  label: "Tax",
                  width: 110.sp,
                ),
                tableHeaderColumn(
                  columnName: "Discount",
                  label: "Discount",
                  width: 110.sp,
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

  _tableActions(ItemModel model, ActionType action) {
    if (action == ActionType.view) {
      Nav.showDialogs(context, ProductDetailsDialog(model: model));
    } else if (action == ActionType.edit) {
      Nav.showDialogs(context, const AddOrUpdateProductDialog(isUpdate: true));
    } else if (action == ActionType.delete) {
      Nav.showDialogs(context, DeleteConfirmDialog(deletedInfo: model.name));
    }
  }
}
