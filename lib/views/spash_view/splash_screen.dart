import 'dart:async';

import 'package:android_pos_ui/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  bool isRequestHasSendOneTime = false;

  int retryCount = 0;

  @override
  void initState() {
    initUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final provider = Provider.of<UserProvider>(context, listen: true);
    // final settingsProvider = Provider.of<SettingsProvider>(context);
    // final isDarkMode = settingsProvider.settings.isDarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   bottom: 0,
          //   right: 0,
          //   child: Opacity(
          //     opacity: isDarkMode ? 0.05 : 0.9,
          //     child: SvgPicture.asset(
          //       "assets/splash_background.svg",
          //       fit: BoxFit.cover,
          //       // color: Colors.red,
          //     ),
          //   ),
          // ),
          Center(
            child: SvgPicture.asset(
              "assets/logo.svg",
              fit: BoxFit.cover,
              height: 98.h,
              width: 130.w,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: size.height * 0.03,
            child:
                // provider.errorType != ErrorType.non
                //     ? errorWidget(context, provider, isDarkMode)
                // :
                loadingWidget(context, false),
          )
        ],
      ),
    );
  }

  // Column errorWidget(
  //     BuildContext context, UserProvider provider, bool isDarkMode) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: IconButton(
  //           onPressed: () async {
  //             retryCount++;
  //             await provider.getProfile();
  //             if (provider.loadingState == LoadingState.loaded) {
  //               initUserData();
  //             } else if (retryCount > 5) {
  //               await UserSharedPreference().logout();

  //               if (context.mounted) {
  //                 Nav.pushRemoveUntil(context, const TabsControllerScreen());
  //               }
  //             }
  //           },
  //           icon: const Center(child: Icon(Icons.refresh)),
  //         ),
  //       ),
  //       Text(
  //         'نعتذر حدث خطأ',
  //         style: Theme.of(context).textTheme.bodySmall?.copyWith(
  //               fontSize: 14,
  //               color: isDarkMode ? Colors.grey.shade500 : null,
  //             ),
  //       ),
  //     ],
  //   );
  // }

  Column loadingWidget(BuildContext context, bool isDarkMode) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox(
              width: 27,
              height: 27,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              )),
        ),
        Text(
          "Loading...",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14,
                color: isDarkMode ? Colors.grey.shade500 : null,
              ),
        ),
      ],
    );
  }

  Timer initUserData() {
    return Timer(
      const Duration(seconds: 2),
      () async {
        // final isLoggedIn = await UserSharedPreference().isLogin();
        // if (isLoggedIn && mounted) {
        //   if (provider.loadingState != LoadingState.loaded) {
        //     await provider.getProfile();
        //   }

        //   if (provider.loadingState == LoadingState.loaded && mounted) {
        //     final inCompleteReader = provider.model?.reader == null &&
        //         provider.model?.userType == "Reader";
        //     if (inCompleteReader) {
        //       provider.restoreProviderInitialState();
        //       Nav.pushReplacement(
        //           context, const RegistrationReaderFormScreen());
        //     } else {
        //       Nav.pushRemoveUntil(
        //         context,
        //         const TabsControllerScreen(),
        //         reloadAllProviders: true,
        //       );
        //       // await Navigator.of(context).pushReplacement(
        //       //   PageRouteBuilder(
        //       //     transitionDuration: const Duration(milliseconds: 1000),
        //       //     pageBuilder: (BuildContext context,
        //       //         Animation<double> animation,
        //       //         Animation<double> secondaryAnimation) {
        //       //       return const TabsControllerScreen();
        //       //     },
        //       //     transitionsBuilder: (BuildContext context,
        //       //         Animation<double> animation,
        //       //         Animation<double> secondaryAnimation,
        //       //         Widget child) {
        //       //       return Align(
        //       //         child: FadeTransition(
        //       //           opacity: animation,
        //       //           child: child,
        //       //         ),
        //       //       );
        //       //     },
        //       //   ),
        //       // );
        //     }
        //   }
        // } else {
        //   if (mounted) {
        //     provider.restoreProviderInitialState();

        await Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 0),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return const LoginView();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          ),
        );
        //   }
        // }
      },
    );
  }
}
