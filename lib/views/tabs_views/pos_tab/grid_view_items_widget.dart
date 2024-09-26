import 'package:android_pos_ui/global_widgets/global_item_widget.dart';
import 'package:flutter/material.dart';

class GridViewItemsWidget extends StatefulWidget {
  const GridViewItemsWidget({super.key});

  @override
  State<GridViewItemsWidget> createState() => _GridViewItemsWidgetState();
}

class _GridViewItemsWidgetState extends State<GridViewItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              itemsDummyList.length,
              (index) => GlobalItemWidget(
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
      ),
    );
  }
}
