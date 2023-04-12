import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../models/snack_model.dart';
import 'card_item_list.dart';

class ListSnack extends StatelessWidget {
  ListSnack({
    super.key,
    required this.listSnack,
  });
  List<SnackModel> listSnack;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GroupedListView<SnackModel, String>(
        elements: listSnack,
        groupBy: (snack) => snack.date.toString(),
        groupSeparatorBuilder: (String groupByValue) => Align(
          alignment: Alignment.topLeft,
          child: Text(
            groupByValue.split(' ')[0].replaceAll('-', '.'),
            style: GoogleFonts.nunitoSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        itemBuilder: (context, SnackModel element) =>
            CardItemList(element: element),
        itemComparator: (item1, item2) =>
            item1.title.compareTo(item2.title), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional
      ),
    );
  }
}
