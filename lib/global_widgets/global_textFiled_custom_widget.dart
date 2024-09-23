import 'package:android_pos_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GlobalTextFiledCustomWidget extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool obscureText;

  const GlobalTextFiledCustomWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<GlobalTextFiledCustomWidget> createState() =>
      _GlobalTextFiledCustomWidgetState();
}

class _GlobalTextFiledCustomWidgetState
    extends State<GlobalTextFiledCustomWidget> {
  bool obscureState = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        style: TextStyle(
          color: ThemeColor.secondary.shade500,
          height: 1,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          fillColor: Colors.transparent,
          filled: true,
          labelStyle: TextStyle(
            // fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: ThemeColor.secondary.shade300,
          ),
          hintText: widget.hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(
              color: ThemeColor.secondary.shade200,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: BorderSide(
              color: ThemeColor.secondary.shade200,
              width: 1,
            ),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    obscureState = !obscureState;
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    "assets/${obscureState ? "visibility_on" : "visibility_off"}.svg",
                    colorFilter: ColorFilter.mode(
                      ThemeColor.secondary.shade500,
                      BlendMode.dstIn,
                    ),
                  ),
                )
              : null,
        ),
        obscureText: widget.obscureText && !obscureState,
      ),
    );
  }
}
