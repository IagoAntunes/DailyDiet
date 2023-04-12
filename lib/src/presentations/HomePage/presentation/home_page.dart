import 'package:dailydiet/src/models/snack_model.dart';
import 'package:dailydiet/src/presentations/HomePage/widgets/button_new_snack.dart';
import 'package:dailydiet/src/presentations/HomePage/widgets/card_porcentage.dart';
import 'package:dailydiet/src/presentations/HomePage/widgets/header.dart';
import 'package:dailydiet/src/presentations/HomePage/widgets/list_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SnackModel> listaElementos = [
    SnackModel(
      title: 'X-tudo',
      date: DateTime(2023, 5, 10),
      hours: const TimeOfDay(hour: 20, minute: 10),
      inDiet: true,
    ),
    SnackModel(
      title: 'X-tudo2',
      date: DateTime(2023, 5, 10),
      hours: const TimeOfDay(hour: 20, minute: 10),
      inDiet: true,
    ),
    SnackModel(
      title: 'X-tudo',
      date: DateTime(2023, 6, 23),
      hours: const TimeOfDay(hour: 20, minute: 10),
      inDiet: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 20),
              const CardPorcentage(),
              const SizedBox(height: 30),
              Text(
                "Refeições",
                style: GoogleFonts.nunitoSans(fontSize: 16),
              ),
              const SizedBox(height: 10),
              ButtonNewSnack(),
              const SizedBox(height: 40),
              ListSnack(listSnack: listaElementos)
            ],
          ),
        ),
      ),
    );
  }
}
