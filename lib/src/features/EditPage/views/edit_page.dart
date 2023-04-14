import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailydiet/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/snack_model.dart';
import '../../HomePage/views/home_page.dart';
import '../../NewSnack/new_snack_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
    required this.snack,
  });
  final SnackModel snack;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.snack.inDiet ? AppColors.greenMid : AppColors.redMid,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Refeição',
          style: GoogleFonts.nunitoSans(
            color: AppColors.gray1,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.gray1),
        centerTitle: true,
        backgroundColor:
            widget.snack.inDiet ? AppColors.greenMid : AppColors.redMid,
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.snack.title,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          widget.snack.description,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(
                          "Data e Hora",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "${DateFormat('dd/MM/yyyy').format(widget.snack.date)} ás ${widget.snack.hour}",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Chip(
                        padding: const EdgeInsets.all(5),
                        backgroundColor: AppColors.gray6,
                        avatar: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.snack.inDiet
                                ? AppColors.greenDark
                                : AppColors.redDark,
                          ),
                        ),
                        label: Text(
                          widget.snack.inDiet
                              ? 'dentro da Dieta'
                              : 'fora da dieta',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewSnackPage(snack: widget.snack),
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
                              Icons.edit_outlined,
                              color: AppColors.gray4,
                            ),
                            const SizedBox(width: 10),
                            const Text('Editar refeição'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Material(
                              color: Colors.transparent,
                              child: Container(
                                color: Colors.black.withOpacity(.3),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Container(
                                      padding: const EdgeInsets.all(30),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      height: 200,
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Deseja realmente excluir o registro da refeição?",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunitoSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 0,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(6),
                                                      ),
                                                      side: BorderSide(
                                                        width: 1,
                                                        color: AppColors.gray1,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Cancelar',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                          color:
                                                              AppColors.gray1,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    FirebaseFirestore
                                                        firestore =
                                                        FirebaseFirestore
                                                            .instance;
                                                    await firestore
                                                        .collection('snacks')
                                                        .doc(widget.snack.id)
                                                        .delete();
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage(),
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColors.gray2,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(6),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                      'Sim, excluir'),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                            side: BorderSide(
                              width: 1,
                              color: AppColors.gray1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outline_rounded,
                              color: AppColors.gray1,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Excluir refeição',
                              style: GoogleFonts.nunitoSans(
                                color: AppColors.gray1,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
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
