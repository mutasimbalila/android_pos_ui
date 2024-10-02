import 'package:android_pos_ui/global_widgets/global_button_widget.dart';
import 'package:android_pos_ui/utils/navigators.dart';
import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DeleteConfirmDialog extends StatelessWidget {
  final String deletedInfo;
  const DeleteConfirmDialog({super.key, required this.deletedInfo});

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
                  width: 370.w,
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delete Transaction details ?",
                        style: TextStyle(
                          color: ThemeColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.sp, bottom: 15.sp),
                        child: Text(
                          "Are you sure you want to delete Transaction (#$deletedInfo)",
                          style: TextStyle(
                            color: ThemeColors.secondary.shade400,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: GlobalButtonWidget(
                              label: "Delete",
                              onTap: () {
                                Nav.pop(context);
                              },
                              backgroundColor: ThemeColors.error,
                              margin: EdgeInsetsDirectional.zero,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GlobalButtonWidget(
                              label: "Cancel",
                              width: 170.w,
                              backgroundColor: ThemeColors.primary.shade50,
                              textColor: ThemeColors.secondary,
                              borderColor: ThemeColors.secondary.shade200,
                              margin: EdgeInsets.zero,
                              onTap: () {
                                Nav.pop(context);
                              },
                            ),
                          ),
                        ],
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
