import 'package:android_pos_ui/global_widgets/global_term_condition_privacy_policy_widget.dart';
import 'package:android_pos_ui/views/auth/login_view/widget/onboarding_image_widget.dart';
import 'package:android_pos_ui/views/auth/new_password/new_password_form.dart';
import 'package:android_pos_ui/views/auth/new_password/new_password_reset_successful_form.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  bool forTestUiPasswordReset = false;
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
            child: Column(
              children: [
                Expanded(
                  child: //TODO this is only for ui test
                      forTestUiPasswordReset
                          ? const ResetPasswordSuccessfulForm()
                          : NewPasswordForm(
                              onResetDone: () {
                                forTestUiPasswordReset = true;
                                setState(() {});
                              },
                            ),
                ),
                const GlobalTermConditionPrivacyPolicyWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDesktopView() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child:
                    //TODO this is only for ui test
                    forTestUiPasswordReset
                        ? const ResetPasswordSuccessfulForm()
                        : NewPasswordForm(
                            onResetDone: () {
                              forTestUiPasswordReset = true;
                              setState(() {});
                            },
                          ),
              ),
              const GlobalTermConditionPrivacyPolicyWidget(),
            ],
          ),
        ),
        const Expanded(
          child: OnboardingImageWidget(),
        ),
      ],
    );
  }
}
