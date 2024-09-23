import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget globalCashedImageNetworkWithLoading(String imageUrl,
    {Key? key,
    double? height,
    double? width,
    double? radius,
    BoxFit? fit,
    bool showNotFoundImage = true}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? 8.r),
    child: CachedNetworkImage(
      height: height,
      width: width,
      key: key,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) {
        // final isDarkMode = context.read<SettingsProvider>().settings.isDarkMode;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 8.r),
                  color: Colors.white, //isDarkMode ? Colors.grey.shade900 :
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image_outlined,
                      color: Colors.black12, // isDarkMode ? Colors.white :
                    ),
                    if (showNotFoundImage) const Text("Not Found"),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        // final isDarkMode = context.read<SettingsProvider>().settings.isDarkMode;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 8.r),
                  color: Colors.white, //isDarkMode ? Colors.grey.shade900 :
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: Colors.black12, //isDarkMode ? Colors.white :
                  ),
                ),
              ),
            ),
            LinearProgressIndicator(value: progress.progress),
          ],
        );
      },
      fit: fit ?? BoxFit.cover,
    ),
  );
}
