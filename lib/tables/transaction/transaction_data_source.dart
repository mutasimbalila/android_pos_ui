import 'package:android_pos_ui/global_widgets/global_icon_button.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/tables/transaction/transaction_table.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TransactionDataSource extends DataGridSource {
  TransactionDataSource() {
    //TODO  move paging to controller
    paginatedTransactions =
        transactionsList.getRange(0, rowsPerPage).toList(growable: false);
    buildPaginatedDataGridRows();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: (dataGridCell.columnName == 'id' ||
                  dataGridCell.columnName == 'salary')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: dataGridCell.value is Widget
              ? dataGridCell.value
              : Text(
                  dataGridCell.value.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: ThemeColors.secondary),
                ));
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (startIndex < transactionsList.length &&
        endIndex <= transactionsList.length) {
      paginatedTransactions = transactionsList
          .getRange(startIndex, endIndex)
          .toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      paginatedTransactions = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = paginatedTransactions.map<DataGridRow>((dg) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: dg.orderID),
        DataGridCell<String>(columnName: 'receipt_no', value: dg.receiptNo),
        DataGridCell<String>(columnName: 'menu', value: dg.menu),
        DataGridCell<String>(
            columnName: 'Collected/Cashier', value: dg.collectedCashier),
        DataGridCell<String>(columnName: 'Date & Time', value: dg.dateTime),
        DataGridCell<Widget>(
          columnName: 'Payment method',
          value: tableCellColoredStatusItem(dg.paymentMethod),
        ),
        DataGridCell<Widget>(columnName: 'Action', value: _buildButtonsBar()),
      ]);
    }).toList(growable: false);
  }

  Row _buildButtonsBar() {
    return Row(
      children: [
        GlobalIconButton(
          svgIcon: "view_icon.svg",
          color: ThemeColors.success,
          onTap: () {},
        ),
        const SizedBox(width: 3),
        GlobalIconButton(
          svgIcon: "edit_icon.svg",
          color: ThemeColors.information,
          onTap: () {},
        ),
        const SizedBox(width: 3),
        GlobalIconButton(
          svgIcon: "delete_icon.svg",
          color: ThemeColors.error,
          onTap: () {},
        ),
      ],
    );
  }

  void updateDataGriDataSource() {
    notifyListeners();
  }
}
