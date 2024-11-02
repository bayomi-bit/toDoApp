import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  String text;

  Function? onPressed;
   CustomBtn({
    super.key,
    required this.text,

     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 50,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 20,
          child: TextButton(
            onPressed: onPressed as void Function()?,
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
