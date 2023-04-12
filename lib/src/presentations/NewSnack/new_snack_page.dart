import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailydiet/core/colors.dart';
import 'package:dailydiet/src/models/snack_model.dart';
import 'package:dailydiet/src/presentations/SendSnack/send_snack_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class NewSnackPage extends StatefulWidget {
  const NewSnackPage({super.key});

  @override
  State<NewSnackPage> createState() => _NewSnackPageState();
}

class _NewSnackPageState extends State<NewSnackPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? selectedHour;
  DateTime? selectedDate;
  bool? isDiet;
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray5,
      appBar: AppBar(
        backgroundColor: AppColors.gray5,
        elevation: 0,
        title: Text(
          'Nova Refeição',
          style: GoogleFonts.nunitoSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.gray1),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOME
                    Text(
                      "Nome",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColors.gray6,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: TextFormField(
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo não pode estar vazio!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //DESCRICAO
                    Text(
                      "Descrição",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColors.gray6,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: TextFormField(
                        controller: descriptionController,
                        minLines: 6,
                        maxLines: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo não pode estar vazio!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Data",
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd/MM/yyyy')
                                            .format(pickedDate);
                                    setState(
                                      () {
                                        selectedDate = pickedDate;
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.gray6,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: selectedDate != null
                                        ? Text(DateFormat('dd/MM/yyyy')
                                            .format(selectedDate!))
                                        : const Icon(Icons.date_range),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hora",
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 6, minute: 0),
                                  ).then(
                                    (time) {
                                      if (time != null) {
                                        setState(() {
                                          selectedHour =
                                              DateFormat('HH:mm').format(
                                            DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              time.hour,
                                              time.minute,
                                            ),
                                          );
                                        });
                                      }
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.gray6,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Center(
                                    child: selectedHour != null
                                        ? Text(selectedHour.toString())
                                        : const Icon(Icons.date_range),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Está dentro da dieta?',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isDiet == true) {
                                  isDiet = null;
                                } else {
                                  isDiet = true;
                                }
                              });
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                color: isDiet == null
                                    ? AppColors.gray6
                                    : (isDiet!
                                        ? AppColors.greenLight
                                        : AppColors.gray6),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                border: isDiet == null
                                    ? null
                                    : (isDiet!
                                        ? Border.all(
                                            width: 1,
                                            color: AppColors.greenDark,
                                          )
                                        : null),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.greenDark,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Sim',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isDiet == false) {
                                  isDiet = null;
                                } else {
                                  isDiet = false;
                                }
                              });
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                color: isDiet == null
                                    ? AppColors.gray6
                                    : (isDiet!
                                        ? AppColors.gray6
                                        : AppColors.redLight),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                border: isDiet == null
                                    ? null
                                    : (isDiet!
                                        ? null
                                        : Border.all(
                                            width: 1,
                                            color: AppColors.redDark)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.redDark,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Não',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () async {
                  if (_form.currentState!.validate() &&
                      isDiet != null &&
                      selectedDate != null &&
                      selectedHour != null) {
                    Timestamp myTimestamp = Timestamp.fromDate(selectedDate!);
                    SnackModel snack = SnackModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: selectedDate!,
                      hour: selectedHour!,
                      inDiet: isDiet!,
                    );
                    await firestore
                        .collection('snacks')
                        .doc(Uuid().v1())
                        .set(snack.toMap());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendSnackPage(isDiet: isDiet!),
                      ),
                    );
                  }
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
            ],
          ),
        ),
      ),
    );
  }
}
