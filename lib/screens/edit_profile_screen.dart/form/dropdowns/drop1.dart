import 'package:flutter/material.dart';
 
// Color(0xffFB8C00),
class dropItem1 extends StatefulWidget {
  const dropItem1({super.key});

  @override
  State<dropItem1> createState() => _dropItem1State();
}

class _dropItem1State extends State<dropItem1> {
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(

       children: [
        // -----------------------------------------
        DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromARGB(
                  255, 255, 255, 255), //background color of dropdown button
              border: Border.all(
                  color: Color(0xffD9D9D9), width: 3), //border of dropdown button
              borderRadius:
                  BorderRadius.circular(5), //border raiuds of dropdown button
              // boxShadow: <BoxShadow>[
              //   //apply shadow on Dropdown button
              //   BoxShadow(
              //       color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
              //       blurRadius: 5)
              // ]
            ),
            child: 
            // Padding(
            //   padding: ,
            //     // padding: EdgeInsets.only(left: 30, right: 30),
            //     child:

                    // ==========================================

                    Container(
                      // padding:EdgeInsets.only(left: 30, right: 30) ,
                  width: 323,
                  height: 53,
                  child: DropdownButton(
                    // isExpanded: true,
                    value: dropdownvalue,

                    icon: const Icon(
                      Icons.expand_circle_down,
                      color: Color(0xffFB8C00),
                    ),

                    underline: Container(),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                )
                // ================================================
                )
                // )
        // -----------------------------------------
      ],
    );
  }
}


// final dropItem1