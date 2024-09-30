import 'package:android_pos_ui/global_widgets/global_product_widget.dart';
import 'package:flutter/material.dart';

class GridViewProductsListWidget extends StatefulWidget {
  const GridViewProductsListWidget({super.key});

  @override
  State<GridViewProductsListWidget> createState() =>
      _GridViewProductsListWidgetState();
}

class _GridViewProductsListWidgetState
    extends State<GridViewProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            itemsDummyList.length,
            (index) => GlobalProductWidget(
                model: itemsDummyList[index],
                showCounter: true,
                onItemSelected: () {
                  itemsDummyList[index].isSelected =
                      !itemsDummyList[index].isSelected;
                  if (itemsDummyList[index].isSelected) {
                    itemsDummyList[index].itemCount = 1;
                  } else {
                    itemsDummyList[index].itemCount = 0;
                  }

                  setState(() {});
                }),
          )),
    );
  }
}
