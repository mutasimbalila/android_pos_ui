import 'dart:io';

import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:android_pos_ui/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
//|| Platform.isMacOS
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1440, 900));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInfo) {
        return ScreenUtilInit(
          minTextAdapt: true,
          designSize: sizingInfo.isDesktop
              ? const Size(1440, 900)
              : sizingInfo.isTablet
                  ? const Size(1024, 768)
                  : ScreenUtil.defaultSize,
          useInheritedMediaQuery: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'POS',
            theme: ThemeData(
              checkboxTheme: CheckboxThemeData(
                  fillColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return ThemeColors.primary;
                      }
                      return Colors.white;
                    },
                  ),
                  side: BorderSide(color: ThemeColors.secondary.shade300),
                  visualDensity: const VisualDensity(horizontal: -4)),
              primaryColor: ThemeColors.primary,
              colorScheme: ColorScheme.fromSeed(seedColor: ThemeColors.primary),
              useMaterial3: false,
              fontFamily: "Manrope",
            ),
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
