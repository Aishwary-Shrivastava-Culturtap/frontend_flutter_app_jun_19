import 'package:flutter/material.dart';

// This is a Custom TextField Widget
class CustomTextField extends StatelessWidget {


  const CustomTextField({Key? key, required this.onChanged, required this.hint})
      : super(key: key);


  final void Function(String)? onChanged;
  final String hint;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(

       //this my button to change the color and navigate to next button 
        onChanged: onChanged,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18)),

             
            hintText: hint,
            helperText: 'Keep it Short'),
      ),
    );
  }
}
