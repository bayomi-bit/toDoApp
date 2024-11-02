import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String? lable ;
   TextForm({super.key, this.controller,this.lable});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $lable';
        }
        return null;
      },
      controller:controller ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

        ),
        label: Text(lable!,style: const TextStyle(
          color: Colors.black38,

        ),),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.white, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(

          borderSide: const BorderSide(

              color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.white,
        filled: true,


      ),

    );
  }
}
