import 'package:flutter/material.dart';

class Nav {
  static Future pushRemoveUntil(BuildContext context, Widget screen) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false);
  }

  static Future pushReplacement(BuildContext context, Widget screen,
      [bool isFullScreenDialog = false]) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
        fullscreenDialog: isFullScreenDialog,
      ),
    );
  }

  static Future push(BuildContext context, Widget screen,
      [bool isFullscreenDialog = false]) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
          fullscreenDialog: isFullscreenDialog,
        ));
  }

  static void pop(BuildContext context) {
    return Navigator.pop(context);
  }

  static void showDialogs(BuildContext context, Widget dialog,
      {bool barrierDismissible = true}) {
    showDialog(
        context: context,
        builder: (context) => dialog,
        barrierDismissible: barrierDismissible);
  }
}
