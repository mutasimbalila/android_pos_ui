import 'package:android_pos_ui/global_widgets/global_term_condition_privacy_policy_widget.dart';
import 'package:android_pos_ui/views/auth/login_view/login_form.dart';
import 'package:android_pos_ui/views/auth/login_view/widget/onboarding_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        mobile: (_) => _buildMobileView(),
        tablet: (_) => _buildDesktopView(),
        desktop: (_) => _buildDesktopView(),
      ),
    );
  }

  _buildMobileView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Column(
              children: [
                Expanded(
                  child: LoginFormSubView(),
                ),
                GlobalTermConditionPrivacyPolicyWidget(),
              ],
            ),
          ),
          const OnboardingImageWidget(),
        ],
      ),
    );
  }

  _buildDesktopView() {
    return const Row(
      children: [
        Expanded(
          child: OnboardingImageWidget(),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: LoginFormSubView(),
              ),
              GlobalTermConditionPrivacyPolicyWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
