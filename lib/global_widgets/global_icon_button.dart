import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GlobalIconButton extends StatelessWidget {
  final String svgIcon;
  final Color color;
  final Function() onTap;
  const GlobalIconButton({
    super.key,
    required this.svgIcon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: color,
        ),
        onPressed: onTap,
        child: SvgPicture.asset("assets/$svgIcon"),
      ),
    );
  }
}
