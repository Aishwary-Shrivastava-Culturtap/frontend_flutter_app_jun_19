import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var headingStyle =
    GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);

var valueStyle = GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400);

final expert_card = Container(
  width: double.infinity,

  padding: const EdgeInsets.all(50),
  decoration: BoxDecoration(
    border: Border.all(
      color: Color.fromARGB(255, 255, 255, 255),
      width: 8,
    ), //Border.all
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 198, 198, 198),
        offset: const Offset(
          5.0,
          5.0,
        ), //Offset
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ), //BoxShadow
      BoxShadow(
        color: Colors.white,
        offset: const Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
  ),
  height: 369,
  // width: double.infinity,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Expert Card",
            style: headingStyle,
          ),
          Icon(
            Icons.share_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
          )
        ],
      )),
      Container(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Expert in location - ",
                style: headingStyle,
              ),
              Text(
                "NA",
                style: valueStyle,
              )
            ],
          )),
      Container(
          child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Visited Places - ",
            style: headingStyle,
          ),
          Text("NA", style: valueStyle)
        ],
      )),
      Container(
          child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Covered Location - ",
            style: headingStyle,
          ),
          Text("NA", style: valueStyle)
        ],
      )),
      Container(
          child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Expertise Rating - ",
            style: headingStyle,
          ),
          Text("NA", style: valueStyle)
        ],
      )),
      Container(
          child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Your Culture Status",
            style: headingStyle,
          ),
          Text("NA", style: valueStyle)
        ],
      )),
    ],
  ),
);
