import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalCounterWidget extends StatefulWidget {
  final int value;
  final Function(int) onResult;
  const GlobalCounterWidget({
    super.key,
    required this.value,
    required this.onResult,
  });

  @override
  State<GlobalCounterWidget> createState() => _GlobalCounterWidgetState();
}

class _GlobalCounterWidgetState extends State<GlobalCounterWidget> {
  // late int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      // margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildIncreaseDecreaseNumber(Icons.remove_outlined, () {
            setState(() {
              if (widget.value != 0) {
                // count -= 1;
                widget.onResult(widget.value - 1);
              }
            });
          }),
          SizedBox(
            width: 30.sp,
            child: Text(
              widget.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: widget.value == 0
                      ? ThemeColors.secondary.shade400
                      : ThemeColors.primary
                  // fontFamily: "",
                  ),
            ),
          ),
          buildIncreaseDecreaseNumber(Icons.add_outlined, () {
            setState(() {
              // count += 1;
              widget.onResult(widget.value + 1);
            });
          }),
        ],
      ),
    );
  }

  Widget buildIncreaseDecreaseNumber(IconData icon, VoidCallback onTap,
      [bool isActive = true]) {
    {
      return SizedBox(
        width: 25.sp,
        height: 25.sp,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
                side: BorderSide(color: ThemeColors.secondary.shade200),
              ),
              shadowColor: Colors.black.withOpacity(0.5),
            ),
            child: Icon(
              icon,
              size: 17.sp,
              color: ThemeColors.secondary,
            )),
      );
    }
  }
}
