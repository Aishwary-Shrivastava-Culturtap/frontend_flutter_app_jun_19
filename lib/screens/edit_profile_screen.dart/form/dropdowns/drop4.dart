import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// Color(0xffFB8C00),
class dropItem4 extends StatefulWidget {
  const dropItem4({super.key});

  @override
  State<dropItem4> createState() => _dropItem4State();
}

class _dropItem4State extends State<dropItem4> {
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
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // -----------------------------------------
        DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromARGB(
                  255, 255, 255, 255), //background color of dropdown button
              border: Border.all(
                  color: Color(0xffD9D9D9),
                  width: 3), //border of dropdown button
              borderRadius:
                  BorderRadius.circular(5), //border raiuds of dropdown button

            ),
            child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child:

                    // ==========================================

                    Container(
                  width: 323,
                  height: 53,
                  child: DropdownButton(
                    isExpanded: true,
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
                ))
        // -----------------------------------------
      ],
    );
  }
}


// final dropItem4