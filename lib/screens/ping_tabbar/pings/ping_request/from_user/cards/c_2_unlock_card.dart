import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/provider/pings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class c_2_accept_card extends StatelessWidget {
  final fromUser;
  final toUser;
  final title;
  final from;
  final to;
  final staus;
  final callId;

  const c_2_accept_card(
      {super.key,
      this.callId,
      
      this.fromUser,
      this.toUser,
      this.title,
      this.from,
      this.to,
      this.staus});

  @override
  Widget build(BuildContext context) {

    final _pings_provider = Provider.of<pings_provider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        alignment: Alignment.center,

        decoration: BoxDecoration(
          //DecorationImage
          border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 8,
          ), //Border.all
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 243, 241, 241),
              offset: Offset(
                5.0,
                5.0,
              ), //Offset
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ), //B
        padding: const EdgeInsets.all(2),
        // color: Colors.black,
        height: 360,
        width: double.infinity,

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------------------------
            Container(
              // oxDecorati

              padding: EdgeInsets.fromLTRB(0, 25, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.person),
                        Icon(Icons.arrow_forward),

                        // Image.asset("person.png"),
                        // Image.asset("connect.png"),
                        // Icon(
                        //   Icons.account_circle,
                        // ),
                        Icon(
                          Icons.account_circle_outlined,
                          size: 38,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 140,
                    height: 16,
                    // padding: EdgeInsets.all(4),
                    color: colorAssets.ORANGE,
                    child: Text("accepted",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0)),
                  )
                ],
              ),
            ),
            // ----------------------------------------
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Trip planning call with",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 18.0))),
                  Container(
                    child: Text("$fromUser",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800, fontSize: 18.0)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),

            // ----------------------------------------

            Container(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Container(
                      child: Icon(
                    Icons.schedule,
                  )),
                  Container(
                    child: Text("8:00 PM - 8:20 PM India",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 18.0)),
                  )
                ],
              ),
            ),
            // ----------------------------------------
            Container(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  const Icon(
                    Icons.date_range,
                  ),
                  Container(
                    child: Text("Date : 15 Nov 2022 'Monday",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 18.0)),
                  )
                ],
              ),
            ),
            // ----------------------------------------
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Trip to Benglore",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 20.0)),
            ),
            // ----------------------------------------

            Text(
              "*You need to unlock calendar to connect with Hemant ",
              style: texttype.t2(color: colorAssets.GREEN),
            ),
            // ----------------------------------------

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: textstyleAssets.textstyle(
                      mycolor: colorAssets.ORANGE,
                      myfontSize: 20.0,
                    ),
                    minimumSize: Size(88, 36),
                    foregroundColor: colorAssets.ORANGE,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                  ),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorAssets.ORANGE,
                    textStyle: textstyleAssets.textstyle(
                        mycolor: colorAssets.ORANGE,
                        myfontSize: 20.0,
                        myfontWeight: FontWeight.bold),
                    minimumSize: Size(88, 36),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Unlock Calander',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
