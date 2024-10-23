import 'package:android_pos_ui/global_widgets/global_app_bar_desktop.dart';
import 'package:android_pos_ui/global_widgets/global_drop_down_searchable.dart';
import 'package:android_pos_ui/views/tabs_views/setting/widget/theme_modes_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SettingsPreferences extends StatelessWidget {
  const SettingsPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalAppBarDeskTop(
              title: "Preferences",
              subTitle: "Customization according to your preferences",
              horizontalTitleAndSub: sizingInfo.isMobile,
              trailing: null,
            ),
            const Divider(),
            const ThemeModesListWidget(),
            const GlobalDropDownSearchable(
              title: "Language",
              list: ["English (US)", "Arabic"],
              initialItem: "English (US)",
              // useStatusBox: true,
            ),
            GlobalDropDownSearchable(
              title: "Currency",
              list: currencies,
              initialItem: currencies.first,
              // useStatusBox: true,
            ),
            GlobalDropDownSearchable(
              title: "Time Zone",
              list: arabicCountryTimeZones,
              initialItem: arabicCountryTimeZones.first,
              // useStatusBox: true,
            ),
            const GlobalDropDownSearchable(
              title: "Sidebar Size",
              list: ["Large (250px)", "Medium (200px)", "Small (150px)"],
              initialItem: "Medium (200px)",
              // useStatusBox: true,
            ),
            const GlobalDropDownSearchable(
              title: "Icons Size",
              list: ["Large (48px)", "Medium (36px)", "Small (24px)"],
              initialItem: "Small (24px)",

              // useStatusBox: true,
            ),
          ],
        );
      },
    );
  }
}

List<String> currencies = [
  'Saudi Riyal (SAR)',
  'Omani Rial (OMR)',
  'Sudanese Pound (SDG)',
  'Qatari Riyal (QAR)',
  'Egyptian Pound (EGP)',
  'Kuwaiti Dinar (KWD)',
  'Bahraini Dinar (BHD)',
  'United Arab Emirates Dirham (AED)',
  'Jordanian Dinar (JOD)',
  'Lebanese Pound (LBP)',
  'Syrian Pound (SYP)',
  'Iraqi Dinar (IQD)',
  'Yemeni Rial (YER)',
  'United States Dollar (USD)',
];

List<String> arabicCountryTimeZones = [
  '(UTC + 03:00) Saudi Arabia',
  '(UTC + 04:00) United Arab Emirates',
  '(UTC + 02:00) Egypt',
  '(UTC + 03:00) Kuwait',
  '(UTC + 03:00) Iraq',
  '(UTC + 03:00) Qatar',
  '(UTC + 03:00) Bahrain',
  '(UTC + 02:00) Jordan',
  '(UTC + 03:00) Oman',
  '(UTC + 03:00) Syria',
  '(UTC + 02:00) Lebanon',
  '(UTC + 03:00) Palestine',
  '(UTC + 03:00) Yemen',
  '(UTC + 02:00) Tunisia',
  '(UTC + 01:00) Morocco',
  '(UTC + 01:00) Algeria',
  '(UTC + 02:00) Sudan',
];
