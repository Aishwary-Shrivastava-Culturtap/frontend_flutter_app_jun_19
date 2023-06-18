import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/model/search_user_model.dart';
import 'package:culturtap/provider/login-form-provider.dart';
import 'package:culturtap/provider/remote_user_provider.dart';
import 'package:culturtap/provider/schedule_call_provider.dart';
import 'package:culturtap/widgets/popup1.dart';
import 'package:culturtap/widgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// // ----------------------------------------------------------------
// final t1 = textstyleAssets.textstyle(
//     myfontSize: 20, myfontWeight: fontwightAssets.ExtraBold);
// // ----------------------------------------------------------------

// t2(
//     {color = colorAssets.BLACK,
//     myfontSize = 18,
//     myfontWeight = fontwightAssets.Bold}) {
//   return textstyleAssets.textstyle(
//       mycolor: color, myfontSize: myfontSize, myfontWeight: myfontWeight);
// }
// // ----------------------------------------------------------------

// final t3 = textstyleAssets.textstyle(
//     myfontSize: 18, myfontWeight: fontwightAssets.Regular);
// // ----------------------------------------------------------------

class s_1_schedule_intr_call extends StatefulWidget {
  static const namedRoute = "/s_1_schedule_intr_call";
  const s_1_schedule_intr_call({super.key});

  @override
  State<s_1_schedule_intr_call> createState() => _s_1_schedule_intr_callState();
}

class _s_1_schedule_intr_callState extends State<s_1_schedule_intr_call> {
  String? finalpickedDate;
  TextEditingController timeinput2 = TextEditingController();
  TextEditingController timeinput1 = TextEditingController();

  String? timefrom;
  String? timeto;

  bool meetingTitle = false;

  // formateTimeZone(timezone) {
  //   if (timezone) {
  //   } else if (timezone) {
  //   } else {}
  // }

  // TimeOfDay selectedTime = TimeOfDay.now();

 Future<void> _selectTime(BuildContext context) async {
    try {
      final TimeOfDay? picked_Time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      // print("${picked_Time!.hour} ${picked_Time.minute}  ${picked_Time.period.name}");
 
//time
      String picked_TimeAsString = picked_Time!.format(context);
      // print("${picked_TimeAsString}-------------picked_TimeAsString--- user");

 

 //date
      DateTime parsedTime = DateFormat.jm().parse(picked_Time!.format(context));
      // print(
          // "${parsedTime}-------parsedTime---------${parsedTime.hour} ${parsedTime.minute} ${parsedTime.second} ${picked_Time.period.name.toUpperCase()}");

  
//add
 
      var finalAddedTime = parsedTime.add(Duration(minutes: 20));
      // print("$finalAddedTime---------- added time");

//date



//time
      var addedtimeforuser = TimeOfDay.fromDateTime(finalAddedTime);
       String addedtime = addedtimeforuser.format(context);
      // print(
      //     "${addedtime}--------------addedtimeforuser -- ${addedtimeforuser.period.name}");

      // _controller.text = "$picked_TimeAsString -- $addedtime ";


         // -------------------picked_TimeAsString adding 0 --------
      List picked_TimeAsString2 = picked_TimeAsString.split(':');
         
      String f = picked_TimeAsString2[0] ;
      String newf  = f.padLeft(2, '0');
      picked_TimeAsString2[0]=newf;
        picked_TimeAsString = picked_TimeAsString2.join(":");
      print(picked_TimeAsString);

       List picked_TimeAsString3 = picked_TimeAsString.split(' ');
  String timeAtIndex0  = picked_TimeAsString3[0].toString()+":00";
  picked_TimeAsString= timeAtIndex0+" "+picked_TimeAsString3[1].toString();
  print(picked_TimeAsString);

      // -------------------addedtime adding 0 --------
      List addedtime2 = addedtime.split(':');
         
      String f2 = addedtime2[0] ;
      String newf2  = f2.padLeft(2, '0');
      addedtime2[0]=newf2;
        addedtime = addedtime2.join(":");
      // print(addedtime);

      List addedtime3 = addedtime.split(' ');
  String addedtimetimeAtIndex0  = addedtime3[0].toString()+":00";
  addedtime= addedtimetimeAtIndex0+" "+addedtime3[1].toString();
  // print(addedtime);


      print("[${picked_TimeAsString} -> ${addedtime}]");

       setState(() {
        timefrom = picked_TimeAsString;
        timeto = addedtime;
        timeinput1.text = timefrom ?? "";
      });
    } catch (e) {
      print(e);
    }
  }


// -----------------------    popup ------------------------------

  @override
  Widget build(BuildContext context) {
    list_user_model _remote_user =
        Provider.of<remote_user_provider>(context).getuser;

    schedule_call_provider _schedule_call_provider =
        Provider.of<schedule_call_provider>(context);

    login_form_provider _login_form_provider =
        Provider.of<login_form_provider>(context);
    request_call() {
      // _schedule_call_provider.requestFrom =
    }
    return Scaffold(
        backgroundColor: colorAssets.WHITE,
        appBar: appbar_with_profile(
          onPressedBack: () {},
          onPressedPing: () {},
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(30),
              // padding: const EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --------------- start -------------
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Schedual Call With",
                              style: texttype.t1,
                            ),
                          ),

                          Container(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Text(
                                "${_remote_user.name}",
                                style: texttype.t3,
                              )),

                          Text(
                              "User provided available time for trip planning interaction calls-",
                              style: texttype.t2()),

                          Container(
                              padding: EdgeInsets.only(top: 10, bottom: 25),
                              child: Row(
                                children: [
                                  Icon(Icons.schedule),
                                  Text(
                                    "${_remote_user.availableTime![0]} - ${_remote_user.availableTime![1]} India (bandwidht)",
                                    style: texttype.t3,
                                  ),
                                ],
                              )),

                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Select Date",
                                    style: texttype.t2(),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    width: 170,
                                    child: TextButton(
                                        onPressed: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            const ColorScheme
                                                                .light(
                                                          primary: Color(
                                                              0xffFB8C00), // header background color
                                                          onPrimary: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255), // header text color
                                                          onSurface: Color(
                                                              0xffFB8C00), // body text color
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary: Colors
                                                                .black, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2100));

                                          if (pickedDate != null) {
                                            print(
                                                "${pickedDate} pickedDate output"); //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            print(
                                                " ${formattedDate}formatted date"); //formatted date output using intl package =>  2021-03-16
                                            setState(() {
                                              finalpickedDate =
                                                  formattedDate; //set output date to TextField value.
                                            });
                                          } else {}
                                        },
                                        style: TextButton.styleFrom(
                                          primary: Color.fromARGB(
                                              255, 255, 254, 253),
                                          backgroundColor: Color(
                                              0xffFB8C00), // Background Color
                                        ),
                                        child: Row(
                                          // mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: Colors.white,
                                            ),

                                            // time
                                            Expanded(
                                              child: Text(
                                                finalpickedDate != null
                                                    ? "$finalpickedDate"
                                                    : "--",
                                                style: texttype.t2(
                                                    color: colorAssets.WHITE),
                                              ),
                                            ),
                                            const Icon(
                                              Icons.expand_more,
                                              color: Colors.white,
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              )),

                          check_user_calender(
                            onTap: () {},
                          ),
                        ]),
                    Container(
                      padding: EdgeInsets.only(top: 40, bottom: 40),
                      child: Text(
                          "*Calendar will help you to select the time for interaction with the user",
                          style: textstyleAssets.textstyle(
                              mycolor: colorAssets.RED,
                              myfontSize: 18.0,
                              myfontWeight: fontwightAssets.Regular)),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Set Time",
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              )),
                          Text(
                              "Note : the call duration will be  for 20 min so make sure that your questions are planned. ",
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Meeting Title",
                            style: GoogleFonts.poppins(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 57,
                              child: TextField(
                                  controller: timeinput2,
                                  //editing controller of this TextField
                                  decoration: InputDecoration(
                                      //icon of text field
                                      labelText:
                                          "Tyle here ..." //label text of field
                                      ),
                                  // readOnly:
                                  //     true, //set it true, so that user will not able to edit text
                                  onChanged: (String value) async {
                                    if (value == "") {
                                      setState(() {
                                        meetingTitle = false;
                                      });
                                    } else {
                                      setState(() {
                                        meetingTitle = true;
                                      });
                                    }
                                  })),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Select your starting time",
                          style: texttype.t2()),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black),

                              controller:
                                  timeinput1, //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon:
                                      Icon(Icons.schedule), //icon of text field
                                  labelText: "Enter Time" //label text of field
                                  ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () {
                                _selectTime(context);
                              },
                            ),
                          ),
                          Text("India Time",
                              style: GoogleFonts.poppins(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 40, bottom: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(" Your selected slot will be ",
                                    style: texttype.t2(
                                        myfontWeight:
                                            fontwightAssets.SemiBold)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.schedule),
                                    Text(
                                        timefrom != null
                                            ? '${timefrom}  --  ${timeto} '
                                            : "00:00   - 00:00  ",
                                        style: texttype.t3),
                                    Text("  India", style: texttype.t2()),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    big_button(
                        condition: true,
                        onTap: () async {
                          try {
                            print(
                                " _schedule_call_provider.setvalue(requestTo: ${_remote_user.uid}");
                            print(
                                "requestFrom: ${_login_form_provider.userId}");
                            print(
                                "from: ${finalpickedDate} ${timefrom}");
                            print(
                                "to:   ${finalpickedDate} ${timeto}");

                            _schedule_call_provider.setvalue(
                                requestToT: _remote_user.uid,
                                titleT: "${timeinput2.text}",
                                requestFromT: _login_form_provider.userId,
                                fromT: "${finalpickedDate} ${timefrom}",
                                
                                toT: "${finalpickedDate} ${timeto}");
 
                            await _schedule_call_provider.add_call();
                            if (_schedule_call_provider.status == "call added") {

                              if (_schedule_call_provider.available) {
                                      await showDialog(
                                        barrierColor: Colors.black26,
                                        context: context,
                                        builder: (context) {
                                          return success_CustomAlertDialog();
                                        },
                                      );
                                    }
                              
                              
                            } else {

                               if (!_schedule_call_provider.available) {
                              await   showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return failer_CustomAlertDialog();
                                },
                              );
                            }
                              
                            }
                           
                          } catch (e) {
                            print(e);
                          }
                        })
                  ])),
        ));
  }
}





class failer_CustomAlertDialog extends StatelessWidget {
  const failer_CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
     child: Container(
       height: 350.0,
       width: 350.0,
      
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Padding(
             padding:  EdgeInsets.all(15.0),
             child: SvgPicture.asset(asset.popup_schedule_call),
           ),
           Container(
             padding: EdgeInsets.all(15.0),
             child: Column(
               children: [
             Text('User is not available at ', style: texttype.t3),
             Text('your selected time ', style: texttype.t3),
              ]
              )
             ),
            
             TextButton(
               
               onPressed: () {
             Navigator.of(context).pop();
           },
               child: Text('Check  User  Calendar', style:  texttype.t2(color: colorAssets.ORANGE),
               )
               )
         
              
            ],
       ),
     ),
);
  }
}

// ---------------------------------------------------------------
class success_CustomAlertDialog extends StatelessWidget {
  const success_CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
     child: Container(
       height: 350.0,
       width: 350.0,
      
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Padding(
             padding:  EdgeInsets.all(15.0),
             child: SvgPicture.asset(asset.popup_schedule_call),
           ),
           Container(
             padding: EdgeInsets.all(15.0),
             child: Column(
               children: [
             Text('Your request is send to the user,  ', style: texttype.t3),
             Text('you can check your pings for request’s status ', style: texttype.t3),
              ]
              )
             ),
            
             TextButton(
               
               onPressed: () {
            //  Navigator.of(context).pop();
            Navigator.of(context).popUntil((route) => route.isFirst);

           },
               child: Text('OK', style:  texttype.t2(color: colorAssets.ORANGE),
               )
               )
         
              
            ],
       ),
     ),
);
  }
}