import 'package:culturtap/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class profile_edit extends StatelessWidget {
  const profile_edit({super.key});

  @override
  Widget build(BuildContext context) {
    return profileedit;
  }
}

final profileedit = Center(
  child: SizedBox(
    width: double.infinity,
    height: 300,
    child: Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,

            // width: 373,
            height: 373,
            color: Color.fromARGB(255, 255, 255, 255),
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.topRight,
            // child: Text(
            //   'One',
            //   style: TextStyle(color: Colors.white),
            // ), //Text
          ), //Container
          Container(
            // width: 250,
            height: 161,
            color: Color(0xffEDEDED),
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child:Container(
              child: Column(
                children: [
                  Icon(
              Icons.slow_motion_video_outlined,
              color: Color(0xffFB8C00),
              
            ),
                    Text("Add Your Cover"),
                    Text("Expereince via video here !")



                ],

              ),


            ) 
            // child: Text(
            //   'Two',
            //   style: TextStyle(color: Colors.white),
            // ), //Text
          ), //Container
          Container(
              height: 300,
              // width: 300,
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              // decoration: BoxDecoration(

              // image: Image.asset("img/avtar.png",height: 132, width: 132,),
              //BoxDecoration
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(asset.AVATAR, height: 132, width: 132),
                    Text("Hemant Singh")
                  ],
                ),
              )
              // Text(
              //   "GeeksforGeeks",
              //   style: TextStyle(color: Colors.white, fontSize: 20.0),
              // ), //Text
              ), //Container
        ], //<Widget>[]
      ), //Stack
    ), //Center
  ), //SizedBox
);//Center
	