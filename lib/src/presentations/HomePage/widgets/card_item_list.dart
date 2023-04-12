import 'package:dailydiet/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/snack_model.dart';

class CardItemList extends StatelessWidget {
  CardItemList({
    super.key,
    required this.element,
  });
  SnackModel element;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: AppColors.gray5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Row(
          children: [
            Text(
              "${element.hours.hour}:${element.hours.minute}",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 15,
                width: 1,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Text(
                element.title,
                style: GoogleFonts.nunitoSans(fontSize: 16),
              ),
            ),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: AppColors.redMid,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
