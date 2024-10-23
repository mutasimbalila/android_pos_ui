import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/tables/permissions/permissions_table.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SettingsUsersPermissions extends StatefulWidget {
  const SettingsUsersPermissions({super.key});

  @override
  State<SettingsUsersPermissions> createState() =>
      _SettingsUsersPermissionsState();
}

class _SettingsUsersPermissionsState extends State<SettingsUsersPermissions> {
  final GlobalKey<SfDataGridState> permissionsKey =
      GlobalKey<SfDataGridState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalAppBarDeskTop(
              title: "User Permissions",
              subTitle: "Manage who has access in your system",
              horizontalTitleAndSub: sizingInfo.isMobile,
              trailing: null,
            ),
            const Divider(),
            Expanded(
              child: PermissionsTable(tableKey: permissionsKey),
            ),
          ],
        );
      },
    );
  }
}
