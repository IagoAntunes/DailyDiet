import 'package:dailydiet/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/snack_model.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
    required this.listaElementos,
  });
  final List<SnackModel> listaElementos;

  int getSequenceSnacks() {
    int maxSequence = 0;
    int count = 0;
    listaElementos.sort((a, b) => a.date.compareTo(b.date));
    for (var element in listaElementos) {
      if (element.inDiet) {
        count++;
      } else {
        if (count > maxSequence) {
          maxSequence = count;
        }
        count = 0;
      }
    }
    return maxSequence;
  }

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
    return Scaffold(
      backgroundColor: AppColors.greenLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: double.parse(calcPorcentageDiet()) >= 50.0
            ? AppColors.greenLight
            : AppColors.redLight,
        iconTheme: IconThemeData(color: AppColors.gray1),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'keyCardPorcentage',
              child: Container(
                height: 100,
                color: double.parse(calcPorcentageDiet()) >= 50.0
                    ? AppColors.greenLight
                    : AppColors.redLight,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${calcPorcentageDiet()}%',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "das refeições dentro da dieta",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'Estatisticas Gerais',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.gray6,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              getSequenceSnacks().toString(),
                              style: GoogleFonts.nunitoSans(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "melhor sequência de pratos dentro da dieta",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.gray6,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              listaElementos.length.toString(),
                              style: GoogleFonts.nunitoSans(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "refeições registradas",
                              style: GoogleFonts.nunitoSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.greenLight,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    listaElementos
                                        .where(
                                            (element) => element.inDiet == true)
                                        .length
                                        .toString(),
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "refeições dentro da dieta",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.redLight,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    listaElementos
                                        .where((element) =>
                                            element.inDiet == false)
                                        .length
                                        .toString(),
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "refeições fora da dieta",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
