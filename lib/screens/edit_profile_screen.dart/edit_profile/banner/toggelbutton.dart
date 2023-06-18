import 'package:culturtap/screens/edit_profile_screen.dart/time/setTime.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:custom_switch/custom_switch.dart';

final heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);
 final normal = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
 final small = GoogleFonts.poppins( fontSize: 14, fontWeight: FontWeight.w400,);
 final smallBold = GoogleFonts.poppins( fontSize: 14, fontWeight: FontWeight.w700,);
 final bold = GoogleFonts.poppins( fontSize: 22, fontWeight: FontWeight.w900,color: Color(0xffFB8C00));

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
//  ==============================================
void _showDialog(BuildContext context) {

 Dialog errorDialog = Dialog(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
  child: Container(
    height: 350.0,
    width: 350.0,
   
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.all(15.0),
          child: Image.asset("lib/popups/watch.png"),
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
          Text('Set your clock', style: smallBold),
          Text('Please provide timing when you will ', style: small),
          Text('be able to attend the calls from other turists.', style: small),
          ]
           )
          ),
         
          TextButton(
            
            onPressed: () {
              Navigator.pop(context);
              // print("pop");

              // Navigator.of(context).pushNamed("/setTimePage");
              Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyAppSecondPage()));




                  print("push");

          // Navigator.of(context).pop();
          // Navigator.push(  
          //         context,  
          //         MaterialPageRoute(builder: (context) => MyAppSecondPage()));
        },
            child: Text('Continue', style:  bold,
            )
            )
      
           
         ],
    ),
  ),
);
showDialog(
  context: context, 
  builder: (BuildContext context) => errorDialog
  );

 
}
// ========================================
  void toggleSwitch(bool value) {
    if (isSwitched == false) {

      setState(() {
        isSwitched = true;
       });
       _showDialog(context);




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
        padding: const EdgeInsets.only(top: 20,bottom: 20),

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
      Image.asset( "assets/img/banner/b1.png", ),

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

 


 

 