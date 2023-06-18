
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    required this.errorText,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(8.0),
      padding: EdgeInsets.all(0.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        validator: validator,
        inputFormatters: inputFormatters,


        decoration: InputDecoration(hintText: hintText,   
        hintStyle: TextStyle(color: Colors.white),
         errorText: errorText,
         enabledBorder: UnderlineInputBorder(  borderSide: BorderSide(color: Colors.orange))
        ),
      ),
    );
  }
}