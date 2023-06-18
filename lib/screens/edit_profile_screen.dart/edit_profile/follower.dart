import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);

var descTextStyle =  GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400);
// TextStyle(
//   color: Colors.black,
//   fontWeight: FontWeight.w800,
//   fontFamily: 'Roboto',
//   letterSpacing: 0.5,
//   fontSize: 18,
//   height: 2,
// );

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
final iconList = DefaultTextStyle.merge(
  style: descTextStyle,
  child: Container(
      color: Color.fromARGB(255, 255, 255, 255),
    
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.perm_identity, color: Color.fromARGB(255, 0, 0, 0) , size: 21,),
              Text('0 followers', style: heading,),
            // const Text('25 min'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.person_add_alt, color: Color.fromARGB(255, 0, 0, 0)),
              Text('0 Following', style: heading),
            // const Text('1 hr'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.add_location_outlined, color: Color.fromARGB(255, 0, 0, 0)),
              Text('1 Location', style: heading),
            // const Text('4-6'),
          ],
        ),
      ],
    ),
  ),
);
