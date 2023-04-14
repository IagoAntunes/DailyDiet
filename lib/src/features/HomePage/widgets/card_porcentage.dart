import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';
import '../../../models/snack_model.dart';
import '../../InfoPage/info_page.dart';

class CardPorcentage extends StatelessWidget {
  CardPorcentage({
    super.key,
    required this.listaElementos,
  });
  final List<SnackModel> listaElementos;
  String calcPorcentageDiet() {
    if (listaElementos.isNotEmpty) {
      var porcentage =
          (listaElementos.where((element) => element.inDiet == true).length *
                  100) /
              listaElementos.length;
      return porcentage.toStringAsFixed(2);
    }
    return "0";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoPage(listaElementos: listaElementos),
          ),
        );
      },
      child: Hero(
        tag: 'keyCardPorcentage',
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: double.parse(calcPorcentageDiet()) >= 50.0
                ? AppColors.greenLight
                : AppColors.redLight,
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
                    color: double.parse(calcPorcentageDiet()) >= 50.0
                        ? AppColors.greenDark
                        : AppColors.redDark,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "${calcPorcentageDiet().isEmpty ? '0' : calcPorcentageDiet()}%",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                    ),
                    Text(
                      "das refeições dentro da dieta",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
