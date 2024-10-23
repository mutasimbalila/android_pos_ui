import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ThemeModesListWidget extends StatefulWidget {
  const ThemeModesListWidget({
    super.key,
  });

  @override
  State<ThemeModesListWidget> createState() => _ThemeModesListWidgetState();
}

class _ThemeModesListWidgetState extends State<ThemeModesListWidget> {
  String selectedMode = "Light Mode";
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Padding(
          padding: EdgeInsets.only(bottom: 30.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.sp),
                child: Text(
                  "Select Themes",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: ThemeColors.secondary,
                  ),
                ),
              ),
              sizingInformation.isMobile
                  ? Wrap(children: _buildModeItems)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _buildModeItems,
                    ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> get _buildModeItems {
    return [
      ThemeModeItemWidget(
        title: "Light Mode",
        svgImage: "light_mode.svg",
        isSelected: selectedMode == "Light Mode",
        margin: EdgeInsetsDirectional.only(end: 10.w),
        onSelect: (isSelected, title) {
          selectedMode = title;
          setState(() {});
        },
      ),
      ThemeModeItemWidget(
        title: "Dark Mode",
        svgImage: "dark_mode.svg",
        isSelected: selectedMode == "Dark Mode",
        margin: EdgeInsetsDirectional.only(end: 10.w),
        onSelect: (isSelected, title) {
          selectedMode = title;
          setState(() {});
        },
      ),
      ThemeModeItemWidget(
        title: "Custom Color",
        svgImage: "custom_mode.svg",
        isSelected: selectedMode == "Custom Color",
        onSelect: (isSelected, title) {
          selectedMode = title;
          setState(() {});
        },
      ),
    ];
  }
}

class ThemeModeItemWidget extends StatelessWidget {
  final String title;
  final String svgImage;
  final bool isSelected;
  final EdgeInsetsGeometry? margin;
  final Function(bool, String) onSelect;
  const ThemeModeItemWidget({
    super.key,
    required this.title,
    required this.svgImage,
    required this.isSelected,
    required this.onSelect,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: Container(
          width: 272.w,
          margin: margin,
          decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.secondary.shade200)),
          child: InkWell(
            onTap: () {
              onSelect(!isSelected, title);
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 13),
                  alignment: Alignment.center,
                  color: ThemeColors.secondary.shade100,
                  child: SvgPicture.asset(
                    "assets/$svgImage",
                    // fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "$title ${isSelected ? "( Active )" : ""}",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: ThemeColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          value: isSelected,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onChanged: null,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
