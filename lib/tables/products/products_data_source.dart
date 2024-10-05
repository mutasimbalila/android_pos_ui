import 'dart:math';

import 'package:android_pos_ui/global_widgets/global_icon_button.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:android_pos_ui/tables/products/products_table.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductsDataSource extends DataGridSource {
  final Function(ItemModel, ActionType) onActionsTapped;
  ProductsDataSource({required this.onActionsTapped}) {
    //TODO  move paging to controller
    paginatedProducts =
        itemsDummyList.getRange(0, rowsPerPage).toList(growable: false);
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
    if (startIndex < itemsDummyList.length &&
        endIndex <= itemsDummyList.length) {
      paginatedProducts =
          itemsDummyList.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      paginatedProducts = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = paginatedProducts.map<DataGridRow>((model) {
      return DataGridRow(cells: [
        DataGridCell<Widget>(
            columnName: 'Product name',
            value: _buildProductNameWithImage(model)),
        DataGridCell<String>(
            columnName: 'Order/day',
            value: (Random().nextInt(99) + 10).toString()),
        DataGridCell<Widget>(
            columnName: 'Category', value: tableCellColoredStatusItem("Salad")),
        DataGridCell<String>(
            columnName: 'Price/unit', value: "\$${model.price}"),
        DataGridCell<String>(
            columnName: 'Stock',
            value: (Random().nextInt(500) + 100).toString()),
        const DataGridCell<String>(columnName: 'Tax', value: "2%"),
        DataGridCell<String>(
            columnName: 'Discount', value: "${(Random().nextInt(20) + 3)}%"),
        DataGridCell<Widget>(
            columnName: 'Action', value: _buildButtonsBar(model)),
      ]);
    }).toList(growable: false);
  }

  Row _buildButtonsBar(ItemModel model) {
    return Row(
      children: [
        GlobalIconButton(
          svgIcon: "view_icon.svg",
          color: ThemeColors.success,
          onTap: () {
            onActionsTapped(model, ActionType.view);
          },
        ),
        const SizedBox(width: 3),
        GlobalIconButton(
          svgIcon: "edit_icon.svg",
          color: ThemeColors.information,
          onTap: () {
            onActionsTapped(model, ActionType.edit);
          },
        ),
        const SizedBox(width: 3),
        GlobalIconButton(
          svgIcon: "delete_icon.svg",
          color: ThemeColors.error,
          onTap: () {
            onActionsTapped(model, ActionType.delete);
          },
        ),
      ],
    );
  }

  _buildProductNameWithImage(ItemModel model) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 10.w,
      leading: SizedBox(
        height: 37.sp,
        width: 37.sp,
        child: globalCashedImageNetworkWithLoading(
          model.imageUrl,
          fit: BoxFit.cover,
          showNotFoundImage: false,
          radius: BorderRadius.circular(100.r),
        ),
      ),
      title: Text(
        model.name,
        maxLines: 1,
      ),
    );
  }

  void updateDataGriDataSource() {
    notifyListeners();
  }
}
