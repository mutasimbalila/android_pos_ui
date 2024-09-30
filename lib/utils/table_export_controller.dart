import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:android_pos_ui/utils/file_helper/save_file_mobile.dart'
    if (dart.library.html) 'helper/save_file_web.dart' as helper;

class TableExportController {
  static Future<void> toExcel({
    required GlobalKey<SfDataGridState> tableKey,
    required String fileName,
    List<String>? excludeColumns,
  }) async {
    final workbook = Workbook();
    final Worksheet worksheet = workbook.worksheets[0];
    tableKey.currentState!.exportToExcelWorksheet(
      worksheet,
      excludeColumns: excludeColumns ?? ["Action"],
    );
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    // File('DataGrid.xlsx')
    //     .writeAsBytes(bytes, flush: true);
    return await helper.saveAndLaunchFile(bytes, '$fileName.xlsx');
  }

  static Future<void> toPdf({
    required GlobalKey<SfDataGridState> tableKey,
    required String fileName,
    List<String>? excludeColumns,
  }) async {
    PdfDocument document = tableKey.currentState!.exportToPdfDocument(
      excludeColumns: excludeColumns ?? ["Action"],
    );
    final List<int> bytes = document.saveSync();
    // File('DataGrid.xlsx')
    //     .writeAsBytes(bytes, flush: true);
    return await helper.saveAndLaunchFile(bytes, '$fileName.pdf');
  }
}
