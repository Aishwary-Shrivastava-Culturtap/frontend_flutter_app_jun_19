// import 'package:edit_profile/form/dropdowns/drop1.dart';
// import 'package:edit_profile/form/dropdowns/drop2.dart';
// import 'package:edit_profile/form/dropdowns/drop3.dart';
// import 'package:edit_profile/form/dropdowns/drop4.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class form_dropout extends StatefulWidget {
  const form_dropout({super.key});

  @override
  State<form_dropout> createState() => _form_dropoutState();
}

// ===============================================

class _form_dropoutState extends State<form_dropout> {
  var heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);
  // Initial Selected Value
  String dropdownvalueGender = 'Male';
  String dropdownvalueLanguage = 'Hindi';

  // List of items in our dropdown menu
  var itemsForGender = ['Male', 'Female'];
  var itemsForLanguage = ['Hindi', 'English'];

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

  @override
  void initState() {
    // whenever the value of the field changes, _updateValue is called
    _controller.addListener(_updateValue);
    super.initState();
  }

  _updateValue() {
    setState(() {}); // this causes the widget to be built again
  }

// ============================================================
  Widget _Profession() {
    return TextField(
      cursorColor: Color(0xffFB8C00),
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Profession',
        hintText: 'Enter Your Profession',
        prefixIcon: Icon(
          Icons.work,
          color: Color(0xffFB8C00),
        ),
        suffixIcon: _controller.text.length > 0
            ? GestureDetector(
                onTap: _controller.clear, // removes the content in the field
                child: Icon(Icons.clear_rounded, color: Color(0xffFB8C00)),
              )
            : null,
      ),
    );
  }

// ============================================================
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

  Widget genderDropout() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 255, 255, 255), //background color of dropdown button
          border: Border.all(
              color: Color(0xffD9D9D9), width: 3), //border of dropdown button
          borderRadius:
              BorderRadius.circular(5), //border raiuds of dropdown button
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: DropdownButton(
            isExpanded: true,
            value: dropdownvalueGender,

            icon: const Icon(
              Icons.expand_circle_down,
              color: Color(0xffFB8C00),
            ),

            underline: Container(),

            // Array list of items
            items: itemsForGender.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalueGender = newValue!;
              });
            },
          ),
        ));
  }

// ============================================================

  Widget LanguageDropout() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 255, 255, 255), //background color of dropdown button
          border: Border.all(
              color: Color(0xffD9D9D9), width: 3), //border of dropdown button
          borderRadius:
              BorderRadius.circular(5), //border raiuds of dropdown button
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: DropdownButton(
            isExpanded: true,
            value: dropdownvalueLanguage,

            icon: const Icon(
              Icons.expand_circle_down,
              color: Color(0xffFB8C00),
            ),

            underline: Container(),

            // Array list of items
            items: itemsForLanguage.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalueLanguage = newValue!;
              });
            },
          ),
        ));
  }

// ============================================================
// ============================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      // padding: EdgeInsets.all(20),
      child: Column(
        children: [

           Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profession",
                    style: heading,
                  ),
                  _Profession(),
                ],
              )),
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: heading,
                  ),
                  genderDropout(),
                ],
              )),

          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date Of Birth",
                    style: heading,
                  ),
                  _DateOfBirth(),
                ],
              )),

          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "language you know",
                    style: heading,
                  ),
                  LanguageDropout(),
                  Text(
                    "Multiselect Field",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color(0xffFB8C00),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),

          // SizedBox(height: 20),
          // Expanded(
          //   child: ListView(
          //     children: list
          //         .where((element) => element.contains(_controller.text))
          //         .map(_renderCard)
          //         .toList(),
          //   ),
          // )
        ],
      ),
    );
  }
}

//           final myform =  Container(
//       width: double.infinity,
//       child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,

//         children: [
//           // ----------------------------------------------------------
//           Container(
//             child: Container(
//               padding: EdgeInsets.all(60),
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Profession",
//                     // style:  ,
//                   ),

//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'InputDecoration',
//                       hintText: 'Enter Your Profession',
//                     ),
//                   )

//                 ],
//               ),
//             ),
//           ),

//           // ----------------------------------------------------------
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Text(
//                       "Date of Birth",
//                       // style: myFontStyle,
//                     )),
//                 dropItem2()
//               ],
//             ),
//           ),

//           // ----------------------------------------------------------
//           Container(
//             padding: EdgeInsets.all(25),

//             // padding: EdgeInsets.only(left: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(child: Text("Gender",
//                 // style: myFontStyle
//                 )),
//                 dropItem3()
//               ],
//             ),
//           ),

//           // ----------------------------------------------------------
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Text("Language you Know", style:
//                     //  myFontStyle
//                      )),
//                 dropItem4(),
//                 Container(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Text("Multiselect Field",
//                     // style: myFontStyle
//                     )),
//               ],
//             ),
//           ),

//           // ----------------------------------------------------------

//           // ----------------------------------------------------------
//         ],
//       )
//     );

//   @override
//   Widget build(BuildContext context) {

//     return(

//     );

// }
// }
