import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hinttext;
  final TextEditingController? controller ;
  final Function(String) onChanged;

  const CustomTextField(
      {required this.labelText,
      required this.onChanged,
      required this.hinttext,  this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller ,

      decoration: InputDecoration(
labelStyle: TextStyle(color: Colors.white),  
      // contentPadding: EdgeInsets.all(2),
        fillColor: Colors.white,
        hoverColor: Colors.white, labelText: labelText,
        focusColor: Colors.white,
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.white),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue)),
      ),
    );
  }
}
