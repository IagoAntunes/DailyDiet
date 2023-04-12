import 'package:dailydiet/src/presentations/InfoPage/info_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class CardPorcentage extends StatelessWidget {
  const CardPorcentage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InfoPage(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.call_made,
                  color: AppColors.greenDark,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "90,86%",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "das refeições dentro da lista",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
