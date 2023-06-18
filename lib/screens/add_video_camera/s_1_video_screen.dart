//
//
//

import 'dart:io';

import 'package:culturtap/provider/video_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:camera/camera.dart';
// import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/screens/add_video_camera/s_2_edit_video.dart';

List<CameraDescription>? camera;

class s_1_video_screen extends StatefulWidget {
  static const namedroute = '/s_1_video_screen';
  const s_1_video_screen({super.key});

  @override
  State<s_1_video_screen> createState() => _s_1_video_screenState();
}

class _s_1_video_screenState extends State<s_1_video_screen> {
  CameraController? _cameraController;
  Future<void>? cameravalue;
  bool isrecording = false;
  bool _isRecordingInProgress = false;
  bool _flash = false;
  late File _videoFile;
  List<File> allFileList = [];

  String videoPath = "";

  @override
  void initState() {
    _cameraController = CameraController(camera![0], ResolutionPreset.high);
    cameravalue = _cameraController!.initialize();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController!.dispose();
  }

  void printlist() {
    print(allFileList.length);
  }

  void printpath() {
    print(allFileList[0].path);
  }

  @override
  Widget build(BuildContext context) {
// ------------------------------------------------

    Future<void> startVideoRecording() async {
      // final CameraController? cameraController = controller;
      if (_cameraController!.value.isRecordingVideo) {
        // A recording has already started, do nothing.
        return;
      }
      try {
        await _cameraController!.startVideoRecording();
        setState(() {
          _isRecordingInProgress = true;
           print(_isRecordingInProgress);
        });
      } on CameraException catch (e) {
        print('Error starting to record video: $e');
      }
    }

// ------------------------------------------------
    final loaded_video_model =
        Provider.of<video_provider>(context, listen: false);

// ---------------------
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // --------------------------------- camera -----------
            FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                ;
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Color.fromARGB(82, 0, 0, 0),
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => printpath(),
                          child: Container(
                            height: 50,
                            width: 50,
                            // color: Color.fromARGB(255, 218, 218, 218),
                            decoration:const BoxDecoration(
                                color: colorAssets.ORANGE,
                                border: Border(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child:const Icon(
                              Icons.add,
                              weight: 30,
                              size: 30,
                              color: Colors.white,
                            ),
                            // ),-----------------------
                          ),
                        ),
                       const Text(
                          "Upload",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    // ------------------------------------------------------------------------
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              startVideoRecording();
                            },
                            onTapUp: (_) async {
                              if (!_cameraController!.value.isRecordingVideo) {
                                // Recording is already is stopped state
                                return null;
                              }
                              try {
                                XFile file = await _cameraController!
                                    .stopVideoRecording();

                                File videoFile = File(file.path);

                                int currentUnix =
                                    DateTime.now().millisecondsSinceEpoch;
                                final directory =
                                    await getApplicationDocumentsDirectory();
                                String fileFormat =
                                    videoFile.path.split('.').last;

                                File temp = await videoFile.copy(
                                  '${directory.path}/$currentUnix.$fileFormat',
                                );
                                loaded_video_model.add(temp);
                                setState(() {
                                  _videoFile = temp;
                                  allFileList.add(_videoFile);

                                  _isRecordingInProgress = false;
                                  print(_isRecordingInProgress);
                                });
                              } on CameraException catch (e) {
                                print('Error stopping video recording: $e');
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: !_isRecordingInProgress
                                  ? colorAssets.ORANGE
                                  : Colors.white,
                              foregroundColor: !_isRecordingInProgress
                                  ? colorAssets.ORANGE
                                  : Colors.white,
                              radius: 40,
                              child: Icon(
                                Icons.circle_outlined,
                                weight: 10,
                                size: 70,
                                color: !_isRecordingInProgress
                                    ? Colors.white
                                    : colorAssets.ORANGE,
                              ),
                            )),
                       const Text(
                          "Add Video",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              print("clicked!");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        s_2_edit_video_screen()),
                              );
                            },
                            child: Container(
                                height: 50,
                                width: 60,
                                // color: Color.fromARGB(255, 218, 218, 218),
                                decoration:const BoxDecoration(
                                    color: colorAssets.ORANGE,
                                    border: Border(),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child:const Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ))),
                        GestureDetector(
                          onTap: () => printlist(),
                          child:const Text(
                            "print",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color:const Color.fromARGB(255, 0, 0, 0),
                height: 90,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:const EdgeInsets.all(20),

                      // height: 50,
                      // width: 50,
                      // decoration: BoxDecoration(
                      //     color: colorAssets.ORANGE,
                      //     border: Border.all(),
                      //     borderRadius: BorderRadius.all(Radius.circular(20))),

                      // color: colorAssets.ORANGE,
                      child:const Text(
                        "< back",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin:const   EdgeInsets.all(20),
                      height: 50,
                      width: 50,
                      // decoration: BoxDecoration(
                      //     color: colorAssets.ORANGE,
                      //     border: Border.all(),
                      //     borderRadius: BorderRadius.all(Radius.circular(20))),

                      // color: colorAssets.ORANGE,
                      child: IconButton(
                          onPressed: () {
                            _flash = !_flash;
                            _flash
                                ? _cameraController!
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController!
                                    .setFlashMode(FlashMode.off);
                          },
                          icon: _flash
                              ? const Icon(Icons.flash_on, color: Colors.white)
                              :const  Icon(Icons.flash_off, color: Colors.white)),
                    )
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

// import 'package:culturtap/constants/constant.dart';
// import 'package:culturtap/screens/add_video_camera/2_edit_video.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:camera/camera.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// List<CameraDescription>? camera;

// class s_1_s_1_video_screen extends StatefulWidget {
//   const s_1_s_1_video_screen({super.key});

//   @override
//   State<s_1_s_1_video_screen> createState() => _s_1_s_1_video_screenState();
// }

// class _s_1_s_1_video_screenState extends State<s_1_s_1_video_screen> {
//   CameraController? _cameraController;
//   Future<void>? cameravalue;
//   bool isrecording = false;
//   bool _isRecordingInProgress = false;
//   bool _flash = false;

//   String videoPath = "";

//   @override
//   void initState() {
//     _cameraController = CameraController(camera![0], ResolutionPreset.high);
//     cameravalue = _cameraController!.initialize();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _cameraController!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future<void> startVideoRecording() async {
//       // final CameraController? cameraController = controller;
//       if (_cameraController!.value.isRecordingVideo) {
//         // A recording has already started, do nothing.
//         return;
//       }
//       try {
//         await _cameraController!.startVideoRecording();
//         setState(() {
//           _isRecordingInProgress = true;
//           print(_isRecordingInProgress);
//         });
//       } on CameraException catch (e) {
//         print('Error starting to record video: $e');
//       }
//     }

// // ------------------------------------------------
//     Future<XFile?> stopVideoRecording() async {}

// // ---------------------
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             // --------------------------------- camera -----------
//             FutureBuilder(
//               future: cameravalue,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return CameraPreview(_cameraController!);
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 ;
//               },
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 color: Color.fromARGB(255, 0, 0, 0),
//                 height: 150,
//                 width: double.infinity,
//                 child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       // mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 50,
//                           // color: Color.fromARGB(255, 218, 218, 218),
//                           decoration: BoxDecoration(
//                               color: colorAssets.ORANGE,
//                               border: Border.all(),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50))),
//                           child: Icon(
//                             Icons.add,
//                             weight: 30,
//                             size: 30,
//                             color: Colors.white,
//                           ),
//                           // ),-----------------------
//                         ),
//                        Text(
//                           "Upload",
//                           style: TextStyle(color: Colors.white),
//                         ),

//                       ],
//                     ),
//                     // ------------------------------------------------------------------------
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,

//                       // mainAxisSize: MainAxisSize.min,
//                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                           GestureDetector(
//                             onTap: () {
//                               startVideoRecording();
//                             },
//                             onTapUp: (_) async {
//                               if (!_cameraController!.value.isRecordingVideo) {
//                                 // Recording is already is stopped state
//                                 return null;
//                               }
//                               try {
//                                 XFile file = await _cameraController!
//                                     .stopVideoRecording();
//                                 setState(() {
//                                   _isRecordingInProgress = false;
//                                   videoPath = file.path;
//                                   print(_isRecordingInProgress);
//                                 });
//                               } on CameraException catch (e) {
//                                 print('Error stopping video recording: $e');
//                               }

//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //       builder: (context) =>
//                               //           edit_s_1_s_1_video_screen(path: videoPath),
//                               //     ));
//                             },
//                             child:
//                             CircleAvatar(
//                               backgroundColor: !_isRecordingInProgress ? colorAssets.ORANGE:Colors.white ,
//                               foregroundColor:!_isRecordingInProgress ? colorAssets.ORANGE:Colors.white ,
//                               radius: 48,
//                               child: Icon(
//                                 Icons.circle_outlined,
//                                 weight: 10,
//                                 size: 90,
//                                 color: !_isRecordingInProgress ?Colors.white: colorAssets.ORANGE,
//                               ),
//                             )),

//                         Text(
//                           "Add Video",
//                           style: TextStyle(color: Colors.white),
//                         ),

//                       ],
//                     ),

//                   Column(
//                     children: [
//                           Container(
//                           height: 50,
//                           width: 50,
//                           // color: Color.fromARGB(255, 218, 218, 218),
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                               border: Border.all(),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           child: Icon(
//                             Icons.add,
//                             weight: 10,
//                             size: 20,
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                           // ),-----------------------
//                         ),

//                          Text(
//                           "try",
//                           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                         ),

//                     ],

//                   )

//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 color: Color.fromARGB(255, 0, 0, 0),
//                 height: 100,
//                 width: double.infinity,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.all(20),

//                       height: 50,
//                       width: 50,
//                       // decoration: BoxDecoration(
//                       //     color: colorAssets.ORANGE,
//                       //     border: Border.all(),
//                       //     borderRadius: BorderRadius.all(Radius.circular(20))),

//                       // color: colorAssets.ORANGE,
//                       child: Text(
//                         "< back",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(20),
//                       height: 50,
//                       width: 50,
//                       // decoration: BoxDecoration(
//                       //     color: colorAssets.ORANGE,
//                       //     border: Border.all(),
//                       //     borderRadius: BorderRadius.all(Radius.circular(20))),

//                       // color: colorAssets.ORANGE,
//                       child: IconButton(
//                           onPressed: () {
//                             _flash = !_flash;
//                             _flash
//                                 ? _cameraController!
//                                     .setFlashMode(FlashMode.torch)
//                                 : _cameraController!
//                                     .setFlashMode(FlashMode.off);
//                           },
//                           icon: _flash
//                               ? Icon(Icons.flash_on, color: Colors.white)
//                               : Icon(Icons.flash_off, color: Colors.white)),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
