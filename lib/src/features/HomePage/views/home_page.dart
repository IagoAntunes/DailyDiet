import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailydiet/src/features/HomePage/widgets/card_porcentage.dart';
import 'package:dailydiet/src/models/snack_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_new_snack.dart';
import '../widgets/header.dart';
import '../widgets/list_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<SnackModel> listaElementos = [];
  late StreamSubscription listener;
  @override
  void initState() {
    super.initState();
    addListeners();
  }

  @override
  void dispose() {
    super.dispose();
    listener.cancel();
  }

  void addListeners() async {
    listener = firestore.collection('snacks').snapshots().listen((snapshot) {
      getAll();
    });
  }

  void getAll({QuerySnapshot<Map<String, dynamic>>? snapshot}) async {
    listaElementos = [];
    snapshot = await firestore.collection('snacks').get();

    // Convertendo em um objeto DateTime
    for (var valor in snapshot.docs) {
      Map<String, dynamic> snack = valor.data();
      listaElementos.add(SnackModel.fromMap(snack));
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
              CardPorcentage(listaElementos: listaElementos),
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
