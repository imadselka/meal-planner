
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String myHintText;
  final Widget myIcon;
  final TextEditingController ? myController;
  final bool isObscure;
  final String ? Function(String?)? myValidator;

  const MyTextField({super.key, required this.myHintText, required this.myIcon, this.myController, required this.isObscure, this.myValidator});
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: myValidator,
      controller: myController,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: myHintText,
        hintStyle: const TextStyle(),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(36))
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 238, 237, 237),
        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myIcon,
          ],
        ),
      ),
    );
  }
}