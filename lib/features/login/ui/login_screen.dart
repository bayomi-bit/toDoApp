import 'package:db/core/const/colors.dart';
import 'package:db/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/wideget/custom_btn.dart';
import '../../../core/wideget/text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController eamilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Log in to HabitHUB",
                  style: TextStyle(
                      color: ColorsManager.primaryColor,
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome back! Sign in using your social\n           account or email to continue us",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextForm(
                        controller: eamilController,
                        lable: "Email",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextForm(
                        controller: passwordController,
                        lable: "password",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomBtn(
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
