import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class message_page extends StatelessWidget {
  const message_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 40),
            alignment: Alignment.centerLeft,
            color: Color.fromARGB(255, 255, 255, 255),
            height: 70,
            width: double.infinity,
            child: Text("Total requests : 21",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
