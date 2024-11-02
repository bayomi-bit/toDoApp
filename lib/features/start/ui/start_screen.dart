import 'package:db/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/wideget/custom_btn.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgrounds.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(
                    " Do your\n task\n quickly\n and easy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 58,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 5),
                  child: Text("Your tasks, your rules, our support",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
                const SizedBox(
                  height: 70,
                ),
                CustomBtn(text: "Start", onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
