import 'package:cloud_firestore/cloud_firestore.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<SnackModel> listaElementos = [];

  @override
  void initState() {
    super.initState();
    getAll();
  }

  void getAll() async {
    QuerySnapshot<Map<String, dynamic>> lista =
        await firestore.collection('snacks').get();

    // Convertendo em um objeto DateTime
    for (var valor in lista.docs) {
      dynamic timestampValue = valor.data()['date'];
      Map<String, dynamic> snack = valor.data();
      if (timestampValue is int) {
        Timestamp timestamp =
            Timestamp.fromMillisecondsSinceEpoch(timestampValue);
        DateTime dateTime = timestamp.toDate();
        valor.data()['date'] = dateTime;
        listaElementos.add(SnackModel.fromMap(snack));
      } else if (timestampValue is Timestamp) {
        DateTime dateTime = timestampValue.toDate();
        valor.data()['date'] = dateTime;
        listaElementos.add(SnackModel.fromMap(snack));
      }
    }
    setState(() {});
  }

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
