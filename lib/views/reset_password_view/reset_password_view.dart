import 'package:android_pos_ui/global_widgets/global_term_condition_privacy_policy_widget.dart';
import 'package:android_pos_ui/views/login_view/widget/onboarding_image_widget.dart';
import 'package:android_pos_ui/views/reset_password_view/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
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
          const OnboardingImageWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Column(
              children: [
                Expanded(
                  child: ResetPasswordForm(),
                ),
                GlobalTermConditionPrivacyPolicyWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDesktopView() {
    return const Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: ResetPasswordForm(),
              ),
              GlobalTermConditionPrivacyPolicyWidget(),
            ],
          ),
        ),
        Expanded(
          child: OnboardingImageWidget(),
        ),
      ],
    );
  }
}
