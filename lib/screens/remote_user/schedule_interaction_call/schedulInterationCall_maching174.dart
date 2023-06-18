import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/provider/schedule_call_provider.dart';
import 'package:culturtap/widgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:provider/provider.dart';

// import '../model/model.dart';
// import '../services/api_service.dart';

final heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);
final normal = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
final small = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
final smallBold = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);
final bold = GoogleFonts.poppins(
    fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xffFB8C00));
// ------------------------------------------------------
// class ApiService {
//   Future<List<GetUserData>?> fetchAlbum() async {
//     final response = await http.get(Uri.parse('http://localhost:3000/posts'));
//     print("success...");
//     // Appropriate action depending upon the
//     // server response
//     // print(json.decode(response.body));
//     if (response.statusCode == 200) {
//       print("condition --------- converter");
//       List<GetUserData> _model = getUserDataFromJson(response.body);
//       print(" ${_model[0].id}");

//       return _model;
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
// }
// -----------------   model -----------------------------
// List<GetUserData> getUserDataFromJson(String str) => json.decode(str) == null
//     ? []
//     : List<GetUserData>.from(
//         json.decode(str)!.map((x) => GetUserData.fromJson(x)));

// String getUserDataToJson(List<GetUserData> data) => json.encode(
//     data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

// class GetUserData {
//   GetUserData({
//     this.id,
//     this.title,
//     this.author,
//   });

//   int? id;
//   String? title;
//   String? author;

//   factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
//         id: json["id"],
//         title: json["title"],
//         author: json["author"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "author": author,
//       };
// }
// --------------------------------------------------------------

class matching extends StatelessWidget {
  matching({super.key});

  String? pickedDat;

  String? time;

  bool isSwitched = false;

  TextEditingController timeinput1 = TextEditingController();

  Future? data;

  // late var _userModel;
  var person;

  @override
  Widget build(BuildContext context) {
    schedule_call_provider _schedule_call_provider =
        Provider.of<schedule_call_provider>(context);

    // Future<void> _showTime() async {
    //   final TimeOfDay? result =
    //       await showTimePicker(context: context, initialTime: TimeOfDay.now());
    //   if (result != null) {
    //     setState(() {
    //       timeinput1.text = result.format(context);

    //      });
    //   }
    // }

//  print(author);
    return Scaffold(
        appBar: appbar_with_profile(
          onPressedBack: () {},
          onPressedPing: () {},
        ),
        // ==============================================

        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(

              // color: Colors.white,
              padding: EdgeInsets.all(30),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // connetThumbnail(_userModel![0].name.toString()),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.account_circle,
                              ),
                              // Image.asset("assets/person.png"),
                              Icon(
                                Icons.sync_alt,
                              ),
                              Icon(
                                Icons.account_circle,
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Schedual Call With",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "hemant",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    // )-----------------------------------------------
                    Padding(
                        padding: EdgeInsets.only(
                          top: 111,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Icon(Icons.schedule),
                            Text(
                                "  ${_schedule_call_provider.onlytimefrom} - ${_schedule_call_provider.onlytimeto}",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            Text("  India   ",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                )),
                          ],
                        )),

                    // -------------------
                    Padding(
                        padding: EdgeInsets.only(
                          bottom: 96,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                                "  ${_schedule_call_provider.finalpickedDate} “Monday”",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        )),

                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),

                      // padding: EdgeInsets.all(20),
                      child: Text(
                        "Schedule call on your calendar by completing payment",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    Padding(
                        padding: EdgeInsets.only(
                          top: 50,
                          bottom: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cost of Trip Planning call",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              cost.COST_TRIP_PLANNING_CALL,
                              style: GoogleFonts.poppins(
                                color: Color(0xff0A8100),
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            // ------------------------ button
                          ],
                        )),

                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          top: 40,
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: 53, //height of button
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
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      // padding:
                                      // EdgeInsets.all(10) //content padding inside button
                                    ),
                                    onPressed: () async {
                                      await showDialog(
                                        barrierColor: Colors.black26,
                                        context: context,
                                        builder: (context) {
                                          return CustomAlertDialog();
                                        },
                                      );
                                      // await _schedule_call_provider.add_call();

                                      // if (_schedule_call_provider.available) {
                                      //   _showDialog(context);
                                      // }
                                    },
                                    child: Text("Request Call",
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)))))))
                  ])),
        ));
    // );
  }
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        // padding: EdgeInsets.all(60),
        height: 350.0,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: SvgPicture.asset(asset.popup_schedule_call),
            ),
            Container(
                padding: EdgeInsets.all(15.0),
                child: Column(children: [
                  Text('Your request is send to the user, ', style: texttype.t3,softWrap: true),
                  Text('you can check your pings for request’s  ',softWrap: true,
                      style: texttype.t3),
                  Text('status.',
                      style: texttype.t3),
                ])),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Continue',
                  style: texttype.t2(color: colorAssets.ORANGE),
                ))
          ],
        ),
      ),
    );
  }
}
