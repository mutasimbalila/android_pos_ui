import 'package:android_pos_ui/global_widgets/global_icon_button.dart';
import 'package:android_pos_ui/global_widgets/global_image_network_with_loading.dart';
import 'package:android_pos_ui/tables/permissions/permissions_table.dart';
import 'package:android_pos_ui/tables/table_components.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PermissionsDataSource extends DataGridSource {
  final Function(UserModel, ActionType) onActionsTapped;
  PermissionsDataSource({required this.onActionsTapped}) {
    //TODO  move paging to controller
    paginatedList = users.getRange(0, rowsPerPage).toList(growable: false);
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
    if (startIndex < users.length && endIndex <= users.length) {
      paginatedList =
          users.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      paginatedList = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = paginatedList.map<DataGridRow>((model) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'No', value: model.id.toString()),
        DataGridCell<Widget>(
            columnName: 'Name', value: _buildProductNameWithImage(model)),
        DataGridCell<String>(columnName: 'Email Address', value: model.email),
        // DataGridCell<String>(
        //     columnName: 'Created Date', value: model.createdAt),
        DataGridCell<String>(columnName: 'Roles', value: model.permission),
        DataGridCell<Widget>(
            columnName: 'Action', value: _buildButtonsBar(model)),
      ]);
    }).toList(growable: false);
  }

  Row _buildButtonsBar(UserModel model) {
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

  _buildProductNameWithImage(UserModel model) {
    return IntrinsicWidth(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 10.w,
        leading: SizedBox(
          height: 37.sp,
          width: 37.sp,
          child: globalCashedImageNetworkWithLoading(
            model.profile,
            fit: BoxFit.cover,
            showNotFoundImage: false,
            radius: BorderRadius.circular(100.r),
          ),
        ),
        title: Text(
          model.name,
          maxLines: 1,
        ),
      ),
    );
  }

  void updateDataGriDataSource() {
    notifyListeners();
  }
}

class UserModel {
  final int id;
  final String name;
  final String email;
  final String permission;
  final String createdAt;
  final String profile;
  UserModel(this.id, this.name, this.email, this.permission, this.createdAt,
      this.profile);
}

List<UserModel> users = [
  UserModel(1, 'Mohammed Almutasim', 'mohammed1@example.com', 'admin',
      '2023-10-01', 'https://randomuser.me/api/portraits/men/1.jpg'),
  UserModel(2, 'Ahmed Ali', 'ahmed2@example.com', 'editor', '2023-10-02',
      'https://randomuser.me/api/portraits/men/2.jpg'),
  UserModel(3, 'Sara Nabil', 'sara3@example.com', 'viewer', '2023-10-03',
      'https://randomuser.me/api/portraits/women/3.jpg'),
  UserModel(4, 'Omar Khaled', 'omar4@example.com', 'admin', '2023-10-04',
      'https://randomuser.me/api/portraits/men/4.jpg'),
  UserModel(5, 'Laila Hassan', 'laila5@example.com', 'editor', '2023-10-05',
      'https://randomuser.me/api/portraits/women/5.jpg'),
  UserModel(6, 'Youssef Ahmed', 'youssef6@example.com', 'viewer', '2023-10-06',
      'https://randomuser.me/api/portraits/men/6.jpg'),
  UserModel(7, 'Fatima Samir', 'fatima7@example.com', 'admin', '2023-10-07',
      'https://randomuser.me/api/portraits/women/7.jpg'),
  UserModel(8, 'Hassan Mohamed', 'hassan8@example.com', 'editor', '2023-10-08',
      'https://randomuser.me/api/portraits/men/8.jpg'),
  UserModel(9, 'Nour Ibrahim', 'nour9@example.com', 'viewer', '2023-10-09',
      'https://randomuser.me/api/portraits/women/9.jpg'),
  UserModel(10, 'Salma Nader', 'salma10@example.com', 'admin', '2023-10-10',
      'https://randomuser.me/api/portraits/women/10.jpg'),
  UserModel(11, 'Khaled Mostafa', 'khaled11@example.com', 'editor',
      '2023-10-11', 'https://randomuser.me/api/portraits/men/11.jpg'),
  UserModel(12, 'Rania Yasser', 'rania12@example.com', 'viewer', '2023-10-12',
      'https://randomuser.me/api/portraits/women/12.jpg'),
  UserModel(13, 'Ali Hamed', 'ali13@example.com', 'admin', '2023-10-13',
      'https://randomuser.me/api/portraits/men/13.jpg'),
  UserModel(14, 'Zainab Tarek', 'zainab14@example.com', 'editor', '2023-10-14',
      'https://randomuser.me/api/portraits/women/14.jpg'),
  UserModel(15, 'Tamer Fathy', 'tamer15@example.com', 'viewer', '2023-10-15',
      'https://randomuser.me/api/portraits/men/15.jpg'),
  UserModel(16, 'Nadia Osama', 'nadia16@example.com', 'admin', '2023-10-16',
      'https://randomuser.me/api/portraits/women/16.jpg'),
  UserModel(17, 'Amr Zaki', 'amr17@example.com', 'editor', '2023-10-17',
      'https://randomuser.me/api/portraits/men/17.jpg'),
  UserModel(18, 'Heba Hossam', 'heba18@example.com', 'viewer', '2023-10-18',
      'https://randomuser.me/api/portraits/women/18.jpg'),
  UserModel(19, 'Ayman Sameh', 'ayman19@example.com', 'admin', '2023-10-19',
      'https://randomuser.me/api/portraits/men/19.jpg'),
  UserModel(20, 'Reem Mostafa', 'reem20@example.com', 'editor', '2023-10-20',
      'https://randomuser.me/api/portraits/women/20.jpg'),
];
