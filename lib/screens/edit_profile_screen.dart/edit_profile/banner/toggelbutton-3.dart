import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:custom_switch/custom_switch.dart';

final heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);
 final normal = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
// -----------------------------------
class toggel3 extends StatefulWidget {
  const toggel3({super.key});

  @override
  State<toggel3> createState() => _toggel3State();
}

class _toggel3State extends State<toggel3> {
 
  bool isSwitched = false;
 
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
       });
     } else {
      setState(() {
        isSwitched = false;
       });
     }
  }

  @override
  Widget build(BuildContext context) {
    return (
    
    Container(
        padding: const EdgeInsets.only(bottom: 20),

    color: const Color.fromARGB(255, 255, 255, 255),
 
    child: Column(children: [
      Container(
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            "Become A Trip Planner",
            style: heading,
          ),
          const Icon(
            Icons.help_outline,
            color: Color(0xffF9A826),
          )
        ]),
      ),
      Image.asset( "assets/img/banner/b3.png", ),

      Container(
        padding: const EdgeInsets.all(20),
        child: Row(
        children: [
          Expanded(child: Text("Turn youself ON for Becoming Trip planner", style: normal,)),
          Expanded(child:
          
          // SwitchScreen()

          // ------------------------------
              Column( mainAxisAlignment: MainAxisAlignment.center, children: [
                  Transform.scale(
                      scale: 2,
                      child: Switch(
                        onChanged: toggleSwitch,
                        value: isSwitched,
                        activeColor:const  Color(0xff0A8100),
                        activeTrackColor: const Color(0xffF9A826),
                        inactiveThumbColor: const Color.fromARGB(255, 177, 177, 177),
                        inactiveTrackColor:const  Color(0xffEDEDED),
                      )),
                  // Text('$textValue', style: TextStyle(fontSize: 20),)
                ])



          // ------------------------------

           )

        ],
      )
      )
  
      ],
  
      ),
  )
  );



 



  }
}

 


 

 