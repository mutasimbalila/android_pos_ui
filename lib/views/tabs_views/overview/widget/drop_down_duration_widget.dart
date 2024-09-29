import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DropDownDurationWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  const DropDownDurationWidget({
    super.key,
    this.height,
    this.width,
    this.margin,
  });

  @override
  State<DropDownDurationWidget> createState() => _DropDownDurationWidgetState();
}

class _DropDownDurationWidgetState extends State<DropDownDurationWidget> {
  String selectedValue = "This Week";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.symmetric(vertical: 10.h),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          alignment: Alignment.center,
          isExpanded: true,
          iconStyleData: IconStyleData(
              icon: SvgPicture.asset("assets/arrow_down_icon.svg")),
          value: selectedValue,
          items: [
            ...["This Week", "This Month", "This Year"].map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.secondary,
                  ),
                ),
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              selectedValue = value;
              setState(() {});
            }
          },
          dropdownStyleData: DropdownStyleData(
            width: widget.width,
            elevation: 1,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.r),
                bottomRight: Radius.circular(11.r),
              ),
              // color: Colors.white,
            ),
            offset: const Offset(0, 8),
          ),
          buttonStyleData: ButtonStyleData(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 50.h,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              border: Border.all(
                color: ThemeColors.secondary.shade200,
              ),
              color: ThemeColors.primary.shade50,
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
