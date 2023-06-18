import 'dart:io';

import 'package:provider/provider.dart';
import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/provider/video_provider.dart';
import 'package:culturtap/screens/add_video_camera/s_3_video_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:camera/camera.dart';
import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/add_video_form_screen.dart';
import 'package:culturtap/provider/add_video_provider.dart';
import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/s_5_add_video_form.dart';
import 'package:video_player/video_player.dart';

// List<CameraDescription>? camera;

class s_2_edit_video_screen extends StatefulWidget {
  // const s_2_edit_video_screen({super.key, required this.path});
  static const nameroute = "/s_2_edit_video_screen";
  // final String path;

  @override
  State<s_2_edit_video_screen> createState() => _s_2_edit_video_screenState();
}

class _s_2_edit_video_screenState extends State<s_2_edit_video_screen> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _add_video_provider = Provider.of<add_video_provider>(context);
                          final _video_provider = Provider.of<video_provider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0.0,
            leadingWidth: 100,
            leading: GestureDetector(
              onDoubleTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(20),
                height: 50,
                width: 50,
                child:const  Text(
                  "< back",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            title: Container(
              margin: EdgeInsets.all(20),
              // height: 50,
              // width: 50,
              child: Text(
                "EDIT",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            actions: [  Container(
                margin: EdgeInsets.all(20),
                height: 50,
                width: 50,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.flash_on, color: Colors.white)),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            // --------------------------------- camera -----------
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : s_3_video_grid_screen_screen(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color.fromARGB(255, 0, 0, 0),
                height: 150,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          // color: Color.fromARGB(255, 218, 218, 218),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Icon(
                            Icons.add,
                            weight: 30,
                            size: 30,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          // ),-----------------------
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            // color: Color.fromARGB(255, 218, 218, 218),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(
                                    width: 10, color: colorAssets.ORANGE),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80))),
                            child: Icon(
                              Icons.add,
                              weight: 10,
                              size: 30,
                              color: colorAssets.ORANGE,
                            ),
                          ),
                        ),
                        // ------------------------
                        GestureDetector(
                          onTap: () {
                          

                          _add_video_provider.setvideo(_video_provider.getItems);


                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         add_video_form_screen( )),
                              );
                          },
                          child: Container(
                              height: 50,
                              width: 60,
                              // color: Color.fromARGB(255, 218, 218, 218),
                              decoration: BoxDecoration(
                                  color: colorAssets.ORANGE,
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color.fromARGB(255, 255, 255, 255),
                              )),
                        ),
                      ],
                    ),
                    // ------------------------------------------------------------------------
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Upload",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Text(
                          "Add Video",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Next",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
