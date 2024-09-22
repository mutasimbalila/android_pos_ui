import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingImageWidget extends StatefulWidget {
  const OnboardingImageWidget({super.key});

  @override
  State<OnboardingImageWidget> createState() => _OnboardingImageWidgetState();
}

class _OnboardingImageWidgetState extends State<OnboardingImageWidget> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          height: sizingInformation.isMobile ? size.height * 0.9 : null,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/previews.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // const Spacer(),
              Container(
                width: double.infinity,
                height: 220.h,
                padding: const EdgeInsets.all(30),
                color: const Color(0xff1A1C1E),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        items: List.generate(
                          3,
                          (index) => _buildOnboardingTextSlideItem(context),
                        ),
                        options: CarouselOptions(
                          height: double.infinity,
                          viewportFraction: 1,
                          initialPage: 0,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: DotsIndicator(
                        dotsCount: 3,
                        position: _current,
                        decorator: DotsDecorator(
                          spacing: EdgeInsets.all(2.sp),
                          size: Size.square(8.sp),
                          activeSize: Size(23.sp, 7.sp),
                          activeColor: Colors.white,
                          color: const Color(0xff6C7278),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column _buildOnboardingTextSlideItem(BuildContext context) {
    return Column(
      children: [
        Text(
          "Elevate Your Sales Experience with Our Seamless POS Solution!",
          style: TextStyle(
            color: Colors.white,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 18.sp,
              desktop: 27.sp,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Step into the Future of Retail with Our User-Friendly POS Platform. Boost Sales, Streamline Operations, and Delight Customers with a Modern, Efficient Checkout Experience!",
            style: TextStyle(
              color: Colors.white,
              fontSize: getValueForScreenType(
                context: context,
                mobile: 13.sp.sp,
                desktop: 12.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
