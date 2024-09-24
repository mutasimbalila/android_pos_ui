import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxCustomWidget extends StatefulWidget {
  final String label;
  final bool value;
  final void Function(bool?) onChanged;
  const CheckBoxCustomWidget(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged});

  @override
  State<CheckBoxCustomWidget> createState() => _CheckBoxCustomWidgetState();
}

class _CheckBoxCustomWidgetState extends State<CheckBoxCustomWidget> {
  late bool checkStatus = widget.value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: ThemeColors.success,
          value: checkStatus,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          onChanged: (value) {
            checkStatus = value ?? false;
            setState(() {});

            widget.onChanged(value);
          },
        ),
        Text(
          widget.label,
          style: TextStyle(
            color: ThemeColors.secondary.shade400,
          ),
        ),
      ],
    );
  }
}
