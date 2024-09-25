import 'package:android_pos_ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalPaymentMethodBar extends StatefulWidget {
  const GlobalPaymentMethodBar({
    super.key,
  });

  @override
  State<GlobalPaymentMethodBar> createState() => _GlobalPaymentMethodBarState();
}

class _GlobalPaymentMethodBarState extends State<GlobalPaymentMethodBar> {
  final paymentMethod = [
    PaymentMethodDummy("Credit Card", "master_card_icon.svg"),
    PaymentMethodDummy("Cash", "cash_icon.svg"),
    PaymentMethodDummy("Mobile App", "scan_barcode_icon.svg"),
  ];
  int selectedPayment = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
              height: sizingInformation.isMobile ? 40.sp : 80.h,
              child: Row(
                children: List.generate(
                  paymentMethod.length,
                  (index) => Expanded(
                    child: GlobalPaymentMethodItemWidget(
                      paymentMethod: paymentMethod[index],
                      onPaymentSelected: () {
                        selectedPayment = index;
                        setState(() {});
                      },
                      isSelected: selectedPayment == index,
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}

class GlobalPaymentMethodItemWidget extends StatelessWidget {
  final PaymentMethodDummy paymentMethod;
  final bool isSelected;
  final Function() onPaymentSelected;
  const GlobalPaymentMethodItemWidget({
    super.key,
    required this.paymentMethod,
    required this.isSelected,
    required this.onPaymentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInfo) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(end: 10.w, bottom: 5.h),
              decoration: BoxDecoration(
                color: ThemeColors.primary.shade50,
                border: Border.all(
                    color: isSelected
                        ? ThemeColors.primary
                        : ThemeColors.secondary.shade200),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(7.r),
                child: InkWell(
                  onTap: () {
                    onPaymentSelected();
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                          SvgPicture.asset("assets/${paymentMethod.svgIcon}")),
                ),
              ),
            ),
            Text(
              paymentMethod.paymentMethod,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: isSelected ? ThemeColors.primary : ThemeColors.secondary,
              ),
            ),
          ],
        );
      },
    );
  }
}

class PaymentMethodDummy {
  final String paymentMethod;
  final String svgIcon;

  PaymentMethodDummy(this.paymentMethod, this.svgIcon);
}
