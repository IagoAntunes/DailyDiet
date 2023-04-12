import 'package:dailydiet/core/colors.dart';
import 'package:dailydiet/src/presentations/HomePage/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendSnackPage extends StatelessWidget {
  SendSnackPage({super.key, required this.isDiet});
  bool isDiet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Continue Assim",
                style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: isDiet ? AppColors.greenDark : AppColors.redDark,
                ),
              ),
              Text(
                "Você continua dentro da dieta. Muito bem!",
                style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(isDiet
                  ? "assets/images/IllustrationIsDiet.png"
                  : "assets/images/IllustrationNoDiet.png"),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
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
                child: const Text('Ir para pagina inicial'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
