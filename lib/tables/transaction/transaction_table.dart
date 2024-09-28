import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/tables/transaction/transaction_data_source.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

int rowsPerPage = 10;

const double _dataPagerHeight = 60.0;

List<TransactionDummy> paginatedTransactions = [];

class TransactionTable extends StatefulWidget {
  const TransactionTable({super.key});

  @override
  State<TransactionTable> createState() => _TransactionTableState();
}

class _TransactionTableState extends State<TransactionTable> {
  final TransactionDataSource _dataSource = TransactionDataSource();

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
              source: _dataSource,
              showCheckboxColumn: true,

              gridLinesVisibility: GridLinesVisibility.none,
              headerGridLinesVisibility: GridLinesVisibility.none,

              selectionMode: SelectionMode.multiple,
              allowSorting: true,
              allowFiltering: true,
              showColumnHeaderIconOnHover: true,

              // showCheckboxColumn: true,
              // allowFiltering: true,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
                side: BorderSide(color: ThemeColors.secondary.shade200),
              ),

              // checkboxColumnSettings:
              //     const DataGridCheckboxColumnSettings(
              //         // width: 30.sp,
              //         ),
              columns: [
                tableHeaderColumn(
                  columnName: "id",
                  label: "Order ID",
                  width: 110.sp,
                ),
                tableHeaderColumn(
                  columnName: "receipt_no",
                  label: "Receipt No",
                  width: 116.sp,
                ),
                tableHeaderColumn(
                  columnName: "menu",
                  label: "Menu",
                  width: 180.sp,
                ),
                tableHeaderColumn(
                  columnName: "Collected/Cashier",
                  label: "Collected/Cashier",
                  width: 180.sp,
                ),
                tableHeaderColumn(
                  columnName: "Date & Time",
                  label: "Date & Time",
                  width: 200.sp,
                ),
                tableHeaderColumn(
                  columnName: "Payment method",
                  label: "Payment method",
                  width: 140.sp,
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
                    ((transactionsList.length / rowsPerPage).ceil()).toDouble(),
              ),
            )),
      ],
    );
  }
}

class TransactionDummy {
  final String orderID;
  final String receiptNo;
  final String menu;
  final String collectedCashier;
  final String dateTime;
  final String paymentMethod;
  TransactionDummy(this.orderID, this.receiptNo, this.menu,
      this.collectedCashier, this.dateTime, this.paymentMethod);
}

final transactionsList = [
  TransactionDummy(
    "1ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "2ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "Mastercard",
  ),
  TransactionDummy(
    "3ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "Mastercard",
  ),
  TransactionDummy(
    "4ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "5ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "Mastercard",
  ),
  TransactionDummy(
    "6ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "7ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "8ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "9ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "10ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "Mastercard",
  ),
  TransactionDummy(
    "11ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "12ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "13ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "14ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "15ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "16ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "17ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "18ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "19ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "20ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "21ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "22ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
  TransactionDummy(
    "ORD12421",
    "MW12131",
    "Tropical Smoothies, Rawoin",
    "Cashier Sirojudi",
    "23 Augustus, 2023  20:12am",
    "QR Code",
  ),
];
