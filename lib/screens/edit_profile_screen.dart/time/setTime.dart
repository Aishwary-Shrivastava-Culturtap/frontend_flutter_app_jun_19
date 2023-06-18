 import 'package:culturtap/screens/edit_profile_screen.dart/myEditSetting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MyApp());
// }
final headingStyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w900,
);

final normalstyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

class MyAppSecondPage extends StatelessWidget {
  const MyAppSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(// primarySwatch: Colors.blue,
            ),
        home: Scaffold(
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
                   const Text(
                      "<",
                      style:  TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    TextButton(
                      child:const Text(
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
                      Image.asset("assets/img/ping.png"),
                      TextButton(
                        child: const Text(
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
                'assets/img/logo.png',
                fit: BoxFit.cover,
                height: 48.75,
                width: 156,
              ),
            ),

            // ==============================================

            body: HomePage()));

    // ==================================
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  TextEditingController timeinput1 = TextEditingController();
  TextEditingController timeinput2 = TextEditingController();
  String? selectedBandwidth;
  //text editing controller for text field
  String? _selectedTime;
  var initialTime1;
  var initialTime2;

  @override
  void initState() {
    timeinput1.text = "";
    timeinput2.text = "";

    super.initState();
    // timeinput1.addListener(_printLatestValue1);
    // timeinput2.addListener(_printLatestValue1);
  }

  // void _printLatestValue1() {
  //   setState(() {
  //     initialTime1 = timeinput1.text;
  //   });
  // }

// void _printLatestValue2() {
//     setState(() {
//       initialTime2 = timeinput2.text;

//     });
//   }

  Future<void> _show1() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        timeinput1.text = result.format(context);

        // _selectedTime = result.format(context);
      });
    }
  }

  Future<void> _show2() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        timeinput2.text = result.format(context);

        // _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //     appBar: AppBar(
        //       title: Text("TimePicker on TextField"),
        //       backgroundColor: Colors.redAccent, //background color of app bar
        //     ),
        //     body:
        Container(
            padding:const EdgeInsets.all(30.0),
// child:   Flexible(
            child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Timing for intermaction calls",
                  style: headingStyle,
                ),
                Text(
                  "Select your time",
                  style: normalstyle,
                ),
// --------------------------------------------------------------

                Container(
                  padding:const EdgeInsets.all(50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "From",
                          style: headingStyle,
                        ),

                        // ===================  TEXT FIELD  ================
                        TextField(
                          controller:
                              timeinput1, //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon: Icon(Icons.schedule), //icon of text field
                              labelText: "Enter Time" //label text of field
                              ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () {
                            _show1();
                          },
                        ),

// --------------------------------------------------------------
                        Text(
                          "TO",
                          style: headingStyle,
                        ),
                        // ===================  TEXT FIELD  ================
                        TextField(
                          controller:
                              timeinput2, //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon:   Icon(Icons.schedule), //icon of text field
                              labelText: "Enter Time" //label text of field
                              ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () {
                            _show2();
                          },
                        ),
                        Text(
                          "India",
                          style: headingStyle,
                        ),
                      ]),
                ),
// ----------------------------------------------------------

                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Bandwidth",
                        style: headingStyle,
                      ),

                      RadioListTile(
                        title: Text("Daily"),
                        value: "Daily",
                        groupValue: selectedBandwidth,
                        onChanged: (value) {
                          setState(() {
                            selectedBandwidth = value.toString();
                          });
                        },
                      ),

                      RadioListTile(
                        title: Text("Only Weekends"),
                        value: "Only Weekends",
                        groupValue: selectedBandwidth,
                        onChanged: (value) {
                          setState(() {
                            selectedBandwidth = value.toString();
                          });
                        },
                      ),

                      // ===================  BUTTON -================

                      Container(
                          padding: EdgeInsets.only(top: 40),
                          child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  height: 63, //height of button
                                  width: double.infinity, //width of button
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:const Color(
                                              0xffFB8C00), //background color of button
                                          side:const BorderSide(
                                              width: 0,
                                              color:  Color(
                                                  0xffFB8C00)), //border width and color
                                          elevation: 3, //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          padding:const EdgeInsets.all(
                                              20) //content padding inside button
                                          ),
                                      onPressed: () {
                                        print("pressed");
                                        Navigator.pop(context);

                                        // Navigator.of(context).pushNamed("/");
                                        // Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const myEditSetting()));
                                      },
                                      child: Text("SET TIME",
                                          style: GoogleFonts.poppins(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w800,
                                              color:const Color.fromARGB(
                                                  255, 255, 255, 255))))))),
                    ],
                  ),
                ),
              ],
            )
            // )
            );
  }
}
// --------------------------------------------

// ====================================
 
 
// ================================

// Container(
//   child: Column(
//     children: [
//           Text("Select Bandwidth", style: headingStyle,),
//           Row(
//             children: [
//               Checkbox(
//                       shape: const CircleBorder(),
//                       value: checkBoxValue1,
//                       onChanged: (bool? newValue) {
//                         setState(() {
//                           checkBoxValue1 = newValue!;
//                         });
//                       }
//                       ),
//                     Text("Daily", style: normalstyle,),
//                   ],
//           ),
//           Row(
//             children: [
//               Checkbox(
//                       shape: const CircleBorder(),
//                       value: checkBoxValue2,
//                       onChanged: (bool? newValue) {
//                         setState(() {
//                           checkBoxValue2 = newValue!;
//                         });
//                       }
//                       ),
//                     Text("Only Weekends", style: normalstyle),
//                   ],
//           ),

//     ],
//   ),
// ),
// --------------------------------

