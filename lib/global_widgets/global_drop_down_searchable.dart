import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalDropDownSearchable<T> extends StatelessWidget {
  final String title;
  final List<T> list;
  final T? initialItem;
  final String? hint;
  final bool useStatusBox;
  final bool enabled;
  final EdgeInsetsGeometry? margin;
  final Function(T?)? onChanged;
  const GlobalDropDownSearchable({
    super.key,
    required this.title,
    required this.list,
    this.initialItem,
    this.hint,
    this.onChanged,
    this.useStatusBox = false,
    this.enabled = true,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.only(bottom: 30.h),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 2),
                _buildDropdown(),
              ],
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 3, child: _buildTitle()),
                Expanded(flex: 5, child: _buildDropdown()),
              ],
            );
          }
        },
      ),
    );
  }

  CustomDropdown<dynamic> _buildDropdown() {
    return CustomDropdown<T>.search(
      hintText: hint,
      enabled: enabled,
      // enabled: false,
      // closedHeaderPadding: EdgeInsets.zero,
      // listItemPadding: EdgeInsets.zero,
      // itemsListPadding: EdgeInsets.zero,
      // expandedHeaderPadding: EdgeInsets.zero,
      items: list,
      headerBuilder: !useStatusBox
          ? null
          : (context, selectedItem, enabled) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 27.sp,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: ThemeColors.secondary.shade100,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      selectedItem.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
      closedHeaderPadding: useStatusBox
          ? EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp)
          : null,
          
      decoration: CustomDropdownDecoration(
        expandedBorder: Border.all(color: ThemeColors.secondary.shade100),
        expandedBorderRadius: BorderRadius.circular(10.r),
        closedBorder: Border.all(color: ThemeColors.secondary.shade100),
        closedBorderRadius: BorderRadius.circular(10.r),
      ),
      disabledDecoration: CustomDropdownDisabledDecoration(
        border: Border.all(color: ThemeColors.secondary.shade100),
        borderRadius: BorderRadius.circular(10.r),
        fillColor: enabled ? null : ThemeColors.secondary.shade100,
        suffixIcon: enabled ? null : const SizedBox(),
      ),
      initialItem: initialItem,
      onChanged: onChanged,
    );
  }

  Text _buildTitle() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        color: ThemeColors.secondary.shade400,
      ),
    );
  }

//To implement Filter
//   class Job with CustomDropdownListFilter {
//   final String name;
//   final IconData icon;
//   const Job(this.name, this.icon);

//   @override
//   String toString() {
//     return name;
//   }

//   @override
//   bool filter(String query) {
//     return name.toLowerCase().contains(query.toLowerCase());
//   }
// }
}
