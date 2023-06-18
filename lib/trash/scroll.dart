import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class scroll_eg extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  scroll_eg({super.key});
//2022-09-04 06:00:00 am

  Future<void> _selectTime(BuildContext context) async {
    try {
      final TimeOfDay? picked_Time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      print("${picked_Time!.hour} ${picked_Time.minute}  ${picked_Time.period.name}");
 
//time
      String picked_TimeAsString = picked_Time!.format(context);
      print("${picked_TimeAsString}-------------picked_TimeAsString--- user");

 

 //date
      DateTime parsedTime = DateFormat.jm().parse(picked_Time!.format(context));
      print(
          "${parsedTime}-------parsedTime---------${parsedTime.hour} ${parsedTime.minute} ${parsedTime.second} ${picked_Time.period.name.toUpperCase()}");

  
//add
 
      var finalAddedTime = parsedTime.add(Duration(minutes: 20));
      print("$finalAddedTime---------- added time");

//date



//time
      var addedtimeforuser = TimeOfDay.fromDateTime(finalAddedTime);
       String addedtime = addedtimeforuser.format(context);
      // print(
      //     "${addedtime}--------------addedtimeforuser -- ${addedtimeforuser.period.name}");

      _controller.text = "$picked_TimeAsString -- $addedtime ";

      // -------------------picked_TimeAsString adding 0 --------
      List picked_TimeAsString2 = picked_TimeAsString.split(':');
         
      String f = picked_TimeAsString2[0] ;
      String newf  = f.padLeft(2, '0');
      picked_TimeAsString2[0]=newf;
        picked_TimeAsString = picked_TimeAsString2.join(":");
      print(picked_TimeAsString);

      // -------------------addedtime adding 0 --------
      List addedtime2 = addedtime.split(':');
         
      String f2 = addedtime2[0] ;
      String newf2  = f2.padLeft(2, '0');
      addedtime2[0]=newf2;
        addedtime = addedtime2.join(":");
      print(addedtime);

      
  print("---------------------------------");



      print("[${picked_TimeAsString} -> ${addedtime}]");
    } catch (e) {
      print(e);
    }
  }

  // --------------------------------------------------------------------------------
  Future<void> _selectdate(BuildContext context) async {
    try {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2100));
      String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate!);

      //('yyyy-MM-dd')

      print(pickedDate);
      print(formattedDate);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              child: GestureDetector(
                  onTap: () {
                    _selectdate(context);
                  },
                  child: Icon(Icons.date_range))),
          Container(
              child: GestureDetector(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Icon(Icons.alarm_rounded))),
          TextField(
            controller: _controller,
          )
        ],
      )),
    );
  }
}




//   Future<void> _selectTime(BuildContext context) async {
  //   try {
  //     final TimeOfDay? result =
  //         await showTimePicker(context: context, initialTime: TimeOfDay.now());
  //     var p = result!.format(context);

  //     // DateTime parsedTime = DateFormat.jm().parse(result!.format(context));

  //     DateTime parsedTime2 =
  //         DateFormat("hh:mm a").parse(result!.format(context));
  //     var finalAddedTime = parsedTime2.add(Duration(minutes: 20));
  //     var v = TimeOfDay.fromDateTime(finalAddedTime).format(context);
  //     print("${result}----------------");
  //     print("${p}----------------");
  //     print("${parsedTime2}----------------");
  //     print("${v}----------------");

  //     setState(() {
  //       timefrom = p;
  //       timeto = v;
  //       timeinput1.text = timefrom ?? "";
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }