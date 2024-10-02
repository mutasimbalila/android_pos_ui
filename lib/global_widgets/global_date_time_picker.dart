import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalDateTimePicker extends StatelessWidget {
  final String title;

  final bool enabled;
  final EdgeInsetsGeometry? margin;
  final DateTime? initialDate;
  final Function(DateTime) onChanged;
  final DateTimePickerType? pickerType;
  const GlobalDateTimePicker({
    super.key,
    required this.onChanged,
    this.pickerType,
    this.initialDate,
    required this.title,
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
                _buildDateTimePicker(context),
              ],
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 3, child: _buildTitle()),
                Expanded(flex: 5, child: _buildDateTimePicker(context)),
              ],
            );
          }
        },
      ),
    );
  }

  Container _buildDateTimePicker(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.secondary.shade100),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 2.sp),
      // margin: EdgeInsetsDirectional.only(bottom: 10.w),
      child: BoardDateTimeInputField(
        // controller: textController,
        minimumDate: DateTime(2023),
        initialDate: initialDate,
        enabled: enabled,

        maximumDate: DateTime.now(),
        pickerType: DateTimePickerType.datetime,
        showPickerType: BoardDateTimeFieldPickerType.mini,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(11),
              child: SvgPicture.asset(
                "assets/calendar_icon.svg",
                // width: 18.sp,
              ),
            )),

        options: const BoardDateTimeOptions(
          languages: BoardPickerLanguages.en(),
          startDayOfWeek: DateTime.saturday,
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium,
        onChanged: onChanged,
        onFocusChange: (val, date, text) {
          // print('on focus changed date: $val, $date, $text');
        },
      ),
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
}
