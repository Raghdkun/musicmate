import 'package:flutter/material.dart';

class NewCustomButton extends StatelessWidget {
  const NewCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {},

      child: const Text('Fluttering Button'),

      style: ButtonStyle(

        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),

        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),

        shadowColor: MaterialStateProperty.all<Color>(Colors.grey),

        elevation: MaterialStateProperty.resolveWith<double>(

          (Set<MaterialState> states) {

            if (states.contains(MaterialState.pressed)) return 10;

            return 5; // default elevation

          },

        ),

        shape: MaterialStateProperty.all<RoundedRectangleBorder>(

          RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(25),

          ),

        ),

        animationDuration: Duration(milliseconds: 200)

      ),

            );
  }
}