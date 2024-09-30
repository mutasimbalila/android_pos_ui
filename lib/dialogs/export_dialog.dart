import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExportDialog extends StatefulWidget {
  const ExportDialog({super.key});

  @override
  State<ExportDialog> createState() => _ExportDialogState();
}

class _ExportDialogState extends State<ExportDialog> {
  bool isExportToMyDevice = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Dialog(
                backgroundColor: ThemeColors.primary.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: 350.sp,
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: SvgPicture.asset(
                          "assets/export_large_icon.svg",
                          // width: 64.sp,
                        ),
                      ),
                      Text(
                        "Export to ?",
                        style: TextStyle(
                          color: ThemeColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.sp, bottom: 15.sp),
                        child: Text(
                          "Choose where you want to export your data",
                          style: TextStyle(
                            color: ThemeColors.secondary.shade400,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ExportTypeWidget(
                            title: "Email",
                            onItemSelected: () {
                              isExportToMyDevice = false;
                              setState(() {});
                            },
                            isSelected: !isExportToMyDevice,
                            svgIcon: "email_icon.svg",
                          ),
                          SizedBox(width: 10.w),
                          ExportTypeWidget(
                            title: "My Device",
                            onItemSelected: () {
                              isExportToMyDevice = true;
                              setState(() {});
                            },
                            isSelected: isExportToMyDevice,
                            svgIcon: "folder_open_icon.svg",
                          )
                        ],
                      ),
                      GlobalButtonWidget(
                        label: "Download",
                        onTap: () {},
                        // width: 330.sp,
                        margin:
                            EdgeInsets.only(top: 15.sp, left: 5.w, right: 5.w),
                      ),
                      GlobalButtonWidget(
                        label: "Cancel",
                        // width: 330.sp,
                        margin: EdgeInsets.only(
                            top: 10.sp, left: 5.w, right: 5.w, bottom: 10.h),
                        // icon: SvgPicture.asset("assets/pdf_icon.svg"),
                        backgroundColor: ThemeColors.primary.shade50,
                        textColor: ThemeColors.secondary,
                        borderColor: ThemeColors.secondary.shade200,
                        onTap: () {
                          Nav.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ExportTypeWidget extends StatelessWidget {
  final String title;
  final String svgIcon;
  final bool isSelected;
  final Function() onItemSelected;
  const ExportTypeWidget({
    super.key,
    required this.title,
    required this.onItemSelected,
    required this.isSelected,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInfo) {
        return Container(
          width: 150.sp,
          height: 100.sp,
          padding: EdgeInsets.zero,
          // margin: EdgeInsetsDirectional.only(end: 10.w),
          decoration: BoxDecoration(
            color: ThemeColors.primary.shade50,
            border: Border.all(
                color: isSelected
                    ? ThemeColors.primary
                    : ThemeColors.secondary.shade200),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(6.r),
            child: InkWell(
              onTap: () {
                onItemSelected();
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/$svgIcon",
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? ThemeColors.primary
                              : ThemeColors.secondary.shade400,
                          BlendMode.srcIn,
                        ),
                        width: 34.sp,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: isSelected
                              ? ThemeColors.primary
                              : ThemeColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
