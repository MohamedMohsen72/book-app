import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {
      required this.buttonColor, required this.Textbutton, required this.ColorText,  this.borderRadius, this.onPressed});
  final String Textbutton;
  final Color buttonColor;
  final Color ColorText;
  final BorderRadius? borderRadius ;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,width: 170,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius??BorderRadius. circular(16),
            ),
         
        ),
        child: Text(
          Textbutton,
          style:TextStyle(fontSize: 25,color:ColorText ),
        ),
      ),
    );
  }
}
