import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String myButtonLabel;
  final Function() ? myOnpressedFct;

  const MyTextButton({super.key, required this.myButtonLabel,this.myOnpressedFct});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: myOnpressedFct,
      child: Text(
        myButtonLabel,
        style: const TextStyle(
          color: Colors.blue,
          /*decoration: TextDecoration.underline,
          decorationColor: Colors.blue,*/
          fontSize: 20,
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String myButtonLabel;
  final void Function()? myOnpressedFct;

  const MyButton({super.key, required this.myButtonLabel, required this.myOnpressedFct});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 500,
      child: ElevatedButton(
        onPressed: myOnpressedFct,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 3, 100, 174),
          foregroundColor: const Color.fromARGB(255, 104, 158, 199),
          side: BorderSide(color: (myOnpressedFct == null)? Colors.grey[300]! : Colors.black, width: 1),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(36)))
        ),
        child: Text(
          myButtonLabel,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  
}