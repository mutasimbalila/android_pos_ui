import 'package:android_pos_ui/utils/colors.dart';
import 'package:android_pos_ui/views/spash_view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
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
          designSize: sizingInfo.isDesktop || sizingInfo.isTablet
              ? const Size(1440, 900)
              : ScreenUtil.defaultSize,
          useInheritedMediaQuery: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'POS',
            theme: ThemeData(
              primaryColor: ThemeColor.primary,
              colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor.primary),
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
