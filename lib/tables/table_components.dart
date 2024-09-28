import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

GridColumn tableHeaderColumn({
  required String columnName,
  required String label,
  double? width,
  AlignmentGeometry? alignment,
}) {
  return GridColumn(
    columnName: columnName,
    width: width ?? double.nan,
    label: Container(
      // color: ThemeColors.tableHeaderColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: alignment ?? AlignmentDirectional.centerStart,
      child: Text(
        label,
        style: TextStyle(color: ThemeColors.secondary.shade300),
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

Widget tableCellColoredStatusItem(String value) {
  return Container(
    alignment: Alignment.center,
    height: 27.sp,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ThemeColors.secondary.shade100,
      borderRadius: BorderRadius.circular(4.r),
    ),
    child: Text(
      value,
      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
    ),
  );
}
