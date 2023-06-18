import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final headingStyle = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w900,
);

final normalstyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

final visitsGreating = Container(
    padding: EdgeInsets.all(30.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " Other visits",
            style: headingStyle,
          ),
          Text(
            "No visits till yet, you can start it now even, just click on add \"+\" button at the bottom of your screen & record your outside surrouding",
            style: normalstyle,
          ),

// ====================================

          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),

            // padding: EdgeInsets.all(15.0),
            child: Text(
                " You can make video post private & public as per your choice. ",
                style: normalstyle
                // style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)
                ),
          ),
          // ),
// =====================================

          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),

            // padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(" Profile Strength Now",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      )),
                  Text("Medium",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffFB8C00))),
                ]),
          ),
          Container(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 63, //height of button
                      width: double.infinity, //width of button
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(
                                  0xffFB8C00), //background color of button
                              side: BorderSide(
                                  width: 0,
                                  color: Color(
                                      0xffFB8C00)), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(3)),
                              padding: EdgeInsets.all(
                                  20) //content padding inside button
                              ),
                          onPressed: () {
                            //code to execute when this button is pressed.
                          },
                          child: Text("set profile",
                              style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      Color.fromARGB(255, 255, 255, 255)
                                      )))))),

                                   
        ]));

// there are two type pop ups that can help
 
