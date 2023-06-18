import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final small = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: new ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Color(0xffFB8C00),
//         accentColor: Color(0xffFB8C00),
//         splashColor: Color(0xffFB8C00),
//       ),

//       title: "Date Picker",
//       home: MyWidget(),
//     );
//   }
// }

class Schedule_trip_assistance_92 extends StatefulWidget {
  const Schedule_trip_assistance_92({super.key});

  @override
  State<Schedule_trip_assistance_92> createState() => _Schedule_trip_assistance_92State();
}

class _Schedule_trip_assistance_92State extends State<Schedule_trip_assistance_92> {
  String? pickedDat;
  String? time;
  int? minAfter20;
  int? hrAfter20;
          var a;
       final _controller = TextEditingController();   


       Future<void> _show1() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat.yMMMMd().format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        _controller.text = formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }

    // _selectedTime = result.format(context);
  }
 


  TextEditingController timeinput1 = TextEditingController();

  
  // Future<void> _show1() async {
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,

  //     initialDate: DateTime.now(), //get today's date
  //     firstDate: DateTime(
  //         2000), //DateTime.now() - not to allow to choose before today.
  //     lastDate: DateTime(2101),
  //   );
  // }
  // builder: (context) {
  //   return Theme(
  //     data: ThemeData.light().copyWith(
  //       primaryColor: const Color(0xFF8CE7F1),
  //       accentColor: const Color(0xFF8CE7F1),
  //       colorScheme: ColorScheme.light(primary: const Color(0xFF8CE7F1)),
  //       buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  //     ),

  // },
  //   );

  //   if (pickedDate != null) {
  //     print(  pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
  //     String formattedDate = DateFormat.yMMMMd().format(  pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
  //     print( formattedDate); //formatted date output using intl package =>  2022-07-04
  //     //You can format date as per your need

  //     setState(() {
  //       this.pickedDate = pickedDate;
  //     });
  //   } else {
  //     print("Date is not selected");
  //   }

  //   // _selectedTime = result.format(context);
  // }

  @override
  Widget build(BuildContext context) {
//////////////////////////      time     //////////////////


    final callwith = Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Text(
        "Schedual Call With",
//  6
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    final note1 = Text(
//
      "User provided available time for trip planning interaction calls-",
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ),
    );

    final time2 = Container(
      padding: EdgeInsets.only(top: 10, bottom: 9),
      child: Row(
        children: [
          Icon(Icons.schedule),
          Text(
            "6:00 PM - 11:30 PM India",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );

    final selectDAte = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          "Select Date",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ));

    final dateButton = SizedBox(
      height: 35,
      width: 170,
      child: TextButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: Color(0xffFB8C00), // header background color
                        onPrimary: Color.fromARGB(
                            255, 255, 255, 255), // header text color
                        onSurface: Color(0xffFB8C00), // body text color
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          primary: Colors.black, // button text color
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
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                pickedDat = formattedDate; //set output date to TextField value.
              });
            } else {}
          },
          style: TextButton.styleFrom(
            primary: Color.fromARGB(255, 255, 254, 253),
            backgroundColor: Color(0xffFB8C00), // Background Color
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),

              // time
              Text(
                pickedDat != null ? "$pickedDat" : "--",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Icon(
                Icons.expand_more,
                color: Colors.white,
              ),
            ],
          )),
    );

    final to,
        orrow = Text("*Tomorrow",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,

          leadingWidth: 100,
          // centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),

          leading: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "<",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                TextButton(
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          // ========================
          actions: [
            Container(
              // padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                // this method can help you to set picture for end
                children: [
                  Image.asset("assets/ping.png"),
                  TextButton(
                    child: Text(
                      "Pings",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],

          toolbarHeight: 105,
          elevation: 0.00,

          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            height: 48.75,
            width: 156,
          ),
        ),

        // ==============================================
        // body:  form_dropout(),
        // body: profile_edit(),
        // body: expert_card,
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date ",
                    // style: heading,
                  ),
                  _DateOfBirth(),
                ],
              )),
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 30, bottom: 60),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [])),
                CalenderCheck(),
                Container(
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: Text(
                      "*Calendar will help you to select the time for interaction with the user",
                      style: GoogleFonts.poppins(
                        color: Color(0xffFF0000),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )),


                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Schedual Trip Assistance",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          )),
                      Text("Choose yuor travelling date!",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          )),
                      Text(
                          "You are scheduling the assistance with Hemant for your next Bengaluru trip. ",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                Text("Select date",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        children: [
                          Text(""),
                        ],
                      ),
                      SizedBox(
                        width: 110,
                        height: 57,
                        child: TextField(
                          controller:
                              timeinput1, //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(Icons.schedule), //icon of text field
                              labelText: "Enter Time" //label text of field
                              ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () {
                            _show1();
                          },
                        ),
                      ),


                      Text("India Time",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 40, bottom: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(" Your selected slot will be ",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.schedule),
                                Text(  hrAfter20!=null?'$time - - $hrAfter20:$minAfter20 $a  ':"",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("  India",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                 
              ],
            ))));
  }


Widget _DateOfBirth() {
    return TextField(
      cursorColor: Color(0xffFB8C00),
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Date Of Birth',
        hintText: 'Enter Your Date Of Birth',
        prefixIcon: Icon(
          Icons.date_range_outlined,
          color: Color(0xffFB8C00),
        ),
        suffixIcon: _controller.text.length > 0
            ? GestureDetector(
                onTap: _controller.clear, // removes the content in the field
                child: Icon(Icons.clear_rounded, color: Color(0xffFB8C00)),
              )
            : null,
      ),
      onTap: () {
        _show1();
      },
    );
  }
// ///////////////////////////   check calender button //////////////////////
  Widget CalenderCheck() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 255, 255, 255), //background color of dropdown button
          // border: (),
          // Border.all(
          //     color: Color(0xffD9D9D9), width: 3), //border of dropdown button
          borderRadius:
              BorderRadius.circular(5), //border raiuds of dropdown button
        ),
        child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Check User Calender",
                  style: GoogleFonts.poppins(
                    color: Color(0xffFB8C00),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  color: Color(0xffFB8C00),
                ),
              ],
            )));
  }

  final selectDateButtons = Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                " Your selected slot will be",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                " From",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
                Text(
                " Till",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
                 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                 
              ],
            )
            ])
            ));

 
}
// +++++++++++++++++++=