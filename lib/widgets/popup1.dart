import 'package:culturtap/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

//  final small = GoogleFonts.poppins( fontSize: 14, fontWeight: FontWeight.w400,);
//  final smallBold = GoogleFonts.poppins( fontSize: 14, fontWeight: FontWeight.w700,);
//  final bold = GoogleFonts.poppins( fontSize: 22, fontWeight: FontWeight.w900,color: Color(0xffFB8C00));
 
class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
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
             Text('Set your clock', style: texttype.t3),
             Text('Please provide timing when you will ', style: texttype.t3),
             Text('be able to attend the calls from other turists.', style: texttype.t3),
             ]
              )
             ),
            
             TextButton(
               
               onPressed: () {
             Navigator.of(context).pop();
           },
               child: Text('Continue', style:  texttype.t2(color: colorAssets.ORANGE),
               )
               )
         
              
            ],
       ),
     ),
);
  }
}
