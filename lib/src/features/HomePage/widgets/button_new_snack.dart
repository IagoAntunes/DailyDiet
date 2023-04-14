import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../NewSnack/new_snack_page.dart';

class ButtonNewSnack extends StatelessWidget {
  ButtonNewSnack({super.key});
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'btnNewSnack',
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewSnackPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gray2,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: AppColors.gray4,
            ),
            const SizedBox(width: 10),
            const Text('Nova refeição'),
          ],
        ),
      ),
    );
  }
}
