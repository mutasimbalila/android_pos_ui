import 'package:android_pos_ui/global_widgets/global_category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalCategoryListBarWidget extends StatefulWidget {
  final List<Category> list;
  final bool showSmallWidget;
  final bool expandItem;
  const GlobalCategoryListBarWidget({
    super.key,
    required this.list,
    this.showSmallWidget = false,
    this.expandItem = false,
  });

  @override
  State<GlobalCategoryListBarWidget> createState() =>
      _GlobalCategoryListBarWidgetState();
}

class _GlobalCategoryListBarWidgetState
    extends State<GlobalCategoryListBarWidget> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            height: sizingInformation.isMobile ? 40.sp : 80.h,
            child: widget.expandItem
                ? Row(
                    children: List.generate(
                      widget.list.length,
                      (index) => Expanded(
                        child: GlobalCategoryItemWidget(
                          category: widget.list[index],
                          showSmallWidget: widget.showSmallWidget,
                          onItemSelected: () {
                            selectedCategory = index;
                            setState(() {});
                          },
                          isSelected: selectedCategory == index,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GlobalCategoryItemWidget(
                      category: widget.list[index],
                      showSmallWidget: widget.showSmallWidget,
                      onItemSelected: () {
                        selectedCategory = index;
                        setState(() {});
                      },
                      isSelected: selectedCategory == index,
                    ),
                  ),
          ),
        );
      },
    );
  }
}

final categoryDummyList = [
  Category("Main Course ", Icons.star),
  Category("Rice Bowl", Icons.rice_bowl),
  Category("Fast food", Icons.fastfood),
  Category("Seafood", Icons.set_meal),
  Category("Drinks", Icons.local_drink_sharp),
];

class Category {
  final String title;
  final IconData? icon;

  Category(this.title, this.icon);
}
