import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//  import 'package:getwidget/getwidget.dart';

final heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);
var descTextStyle =
    GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400);

class fetch_data extends StatelessWidget {
  fetch_data({super.key});

  @override
  Widget build(BuildContext context) {
    return (otherapp);
  }

  final otherapp = Container(
      padding: const EdgeInsets.all(40),
      color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Fetch details from", style: heading),
          Container(
            padding: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  
                 Column(
                  children: [
                    Image.asset("assets/icons/gmail.png"),
                    Text(
                      "google",
                      style: descTextStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/icons/facebook.png"),

                     Text(
                      "Facebook",
                      style: descTextStyle,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ));
}
