import 'package:culturtap/provider/pings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class c_1_pending_card extends StatelessWidget {
  const c_1_pending_card(
      {super.key,
      this.callId,
      this.fromUser,
      this.toUser,
      this.title,
      this.from,
      this.to,
      this.staus});

  final fromUser;
  final toUser;
  final title;
  final from;
  final to;
  final staus;
  final callId;

   Future<void> _refresh_list(BuildContext context) async{
          await  Provider.of<pings_provider>(context ,  listen: false).getUsers();
       
        }

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
        width: 360,

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
                    color: const Color(0xffFF0000),
                    child: Text("$staus",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
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
                      child: Text(" ",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 18))),
                  Container(
                    child: Text("$fromUser",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800, fontSize: 18)),
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
                            fontWeight: FontWeight.w400, fontSize: 18)),
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
                            fontWeight: FontWeight.w400, fontSize: 18)),
                  )
                ],
              ),
            ),
// ----------------------------------------
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Trip to Benglore",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 20)),
            ),
// ----------------------------------------
            Container(
              padding: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: TextButton(
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(
                      color: const Color(0xffFB8C00),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  _pings_provider.cancle_request(callId).then((value) {
                    if (value) {
                        _refresh_list(context);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: const Duration(seconds: 15),
                        content: Text("successfully canceled"),
                      ));
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
