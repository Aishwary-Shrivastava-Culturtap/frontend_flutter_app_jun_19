import 'dart:io';

import 'package:camera/camera.dart';
import 'package:culturtap/widgets/suuceess_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/provider/video_provider.dart';
import 'package:culturtap/provider/add_video_provider.dart';
import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/star.dart';
import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/successPage.dart';
import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/textformField.dart';
import 'package:culturtap/screens/edit_profile_screen.dart/form/dropdowns/drop1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:video_player/video_player.dart';

// final text1 =   GoogleFonts.poppins( fontSize: 16, color: Colors.white,
//   fontWeight: FontWeight.w700,
// );

text1({size = 16.0, color = Colors.white, fontWeight = FontWeight.w700}) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight);
}

class add_video_form_screen extends StatefulWidget {
  static const namedRoute = "/add_video_form_screen";
  // final List videos;
  const add_video_form_screen({Key? key}) : super(key: key);
  @override
  _add_video_form_screenState createState() => _add_video_form_screenState();
}

class _add_video_form_screenState extends State<add_video_form_screen> {
  final _formKey = GlobalKey<FormState>();
  late add_video_provider _add_video_provider;
  // var dropdownAvailabilty;
  String Describe_experience = "";
  String like_aboute_place = "";
  String Review_place = "";
  int rate_experience = 0;
  String authority = "";
  String location = "";
  bool uplload_btn = false;

  // List<File> allFileList = [];
  CameraController? _cameraController;

  String? dropdownValueAvailabilty = 'private';
  var dropdownValueAvailabiltyitems = <String>['private', 'protected'];

  String? dropdownCategory = 'catergory';
  var dropdownvalueCategoryItems = <String>['catergory', 'catergory2'];

  String? dropdownGenre = 'genre';
  var dropdownvalueGenreItems = <String>['genre', 'genre2'];

  int mycount = 0;
  bool _isInit = false;
  VideoPlayerController? videoController;
  bool play = false;
  List loader_video = [];
  // final String id;
  // Future<void> _startVideoPlayer() async {
  //   if (widget.videos != null) {
  //     videoController = VideoPlayerController.file(widget.videos[0]);

  //     await videoController!.setLooping(true);
  //     await videoController!.play();
  //   }
  // }
  @override
  void initState() {
    super.initState();
    loader_video = Provider.of<video_provider>(context, listen: false).getItems;

    videoController = VideoPlayerController.file(loader_video[0])
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  //  @override
  // void didChangeDependencies() {

  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Products>(context).fetchAndSetProducts().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }
// ----------------------------------------------------------------------
// Future<void> _startVideoPlayer() async {
//   if (_videoFile != null) {
//     videoController = VideoPlayerController.file(_videoFile!);
//     await videoController!.initialize().then((_) {
//       // Ensure the first frame is shown after the video is initialized,
//       // even before the play button has been pressed.
//       setState(() {});
//     });
//     await videoController!.setLooping(true);
//     await videoController!.play();
//   }
// }
  // refreshAlreadyCapturedImages() async {
  //   // Get the directory
  //   final directory = await getApplicationDocumentsDirectory();
  //   List<FileSystemEntity> fileList = await directory.list().toList();
  //   allFileList.clear();

  //   List<Map<int, dynamic>> fileNames = [];
  //   late File _videoFile;

  //   // Searching for all the image and video files using
  //   // their default format, and storing them
  //   fileList.forEach((file) {
  //     if (file.path.contains('.jpg') || file.path.contains('.mp4')) {
  //       setState(() {
  //         allFileList.add(File(file.path));
  //       });

  //       String name = file.path.split('/').last.split('.').first;
  //       fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
  //     }
  //   });

  //   // Retrieving the recent file
  //   if (fileNames.isNotEmpty) {
  //     // final recentFile =
  //     //     fileNames.reduce((curr, next) => curr[0] > next[0] ? curr : next);
  //     // String recentFileName = recentFile[1];
  //     // // Checking whether it is an image or a video file
  //     // if (recentFileName.contains('.mp4')) {
  //     //   _videoFile = File('${directory.path}/$recentFileName');
  //     //   _startVideoPlayer();
  //     // } else {
  //     //   _imageFile = File('${directory.path}/$recentFileName');
  //     // }

  //     // setState(() {});
  //   }
  // }

  // @override
  Widget build(BuildContext context) {
    _add_video_provider = Provider.of<add_video_provider>(context);
    return Scaffold(
      // ------------------------- app bar ---------------
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'COMPOSE',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: [
          const Icon(
            Icons.settings,
            size: 25,
          )
        ],
      ),

      // ------------------------------------------------------
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.black,
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white, width: 8),
                      ),
                      child: videoController!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: videoController!.value.aspectRatio,
                              child: VideoPlayer(videoController!),
                            )
                          : Container(
                              color: Colors.black,
                            ),
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, color: Colors.white),
                      Text('Location', style: text1()),
                      Text('284002, Out Side datia gate, Jhansi',
                          style: text1()),
                      const SizedBox(
                        height: 30,
                      ),
                      Text('EDIT', style: text1(color: Colors.orange)),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Category",
                              style: texttype.t5,
                            ),
                            DropdownButton<String>(
                              dropdownColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              icon: const Icon(Icons.expand_more,
                                  color: colorAssets.ORANGE),
                              value: dropdownCategory,
                              items: dropdownvalueCategoryItems
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          color: colorAssets.ORANGE)),
                                );
                              }).toList(),
                              onChanged: (selectedItem) {
                                setState(() {
                                  dropdownCategory = selectedItem;
                                  print(dropdownCategory);
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Genre", style: texttype.t5),
                            DropdownButton<String>(
                              dropdownColor: Color.fromARGB(255, 255, 255, 255),
                              icon: const Icon(Icons.expand_more,
                                  color: colorAssets.ORANGE),
                              value: dropdownGenre,
                              items:
                                  dropdownvalueGenreItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          color: colorAssets.ORANGE)),
                                );
                              }).toList(),
                              onChanged: (selectedItem) {
                                setState(() {
                                  dropdownGenre = selectedItem;
                                  print(dropdownGenre);
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // --------------------------------------------------------------------------------------------
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Describe your experience', style: text1()),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle: const TextStyle(color: Colors.white),
                              errorText: Describe_experience.isEmpty
                                  ? "please fill"
                                  : null,
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              labelStyle:
                                  const TextStyle(color: colorAssets.WHITE),
                              labelText: 'Description'),
                          // maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            setState(() {
                              Describe_experience = value!;
                            });
                          },

                          // focusNode: _descriptionFocusNode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a description.';
                            }
                            if (value.length < 10) {
                              return 'Should be at least 10 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // setState(() {
                            //   Describe_experience = value!;
                            // });
                            // _editedProduct = Product(
                            //   title: _editedProduct.title,
                            //   price: _editedProduct.price,
                            //   description: value,
                            //   imageUrl: _editedProduct.imageUrl,
                            //   id: _editedProduct.id,
                            //   isFavorite: _editedProduct.isFavorite,
                            // );
                          },
                        ),
                      ],
                    ),
                  ),

                  // --------------------------------------------------------------------------------------------
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('What you don’t like about this place? ',
                                style: text1()),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Description',
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  errorText: like_aboute_place.isEmpty
                                      ? "please fill"
                                      : null,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  labelStyle:
                                      TextStyle(color: colorAssets.WHITE),
                                  labelText: 'Description'),
                              // maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              onChanged: (value) {
                                setState(() {
                                  like_aboute_place = value!;
                                });
                              },

                              // focusNode: _descriptionFocusNode,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a description.';
                                }
                                if (value.length < 10) {
                                  return 'Should be at least 10 characters long.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                // setState(() {
                                //   Describe_experience = value!;
                                // });
                                // _editedProduct = Product(
                                //   title: _editedProduct.title,
                                //   price: _editedProduct.price,
                                //   description: value,
                                //   imageUrl: _editedProduct.imageUrl,
                                //   id: _editedProduct.id,
                                //   isFavorite: _editedProduct.isFavorite,
                                // );
                              },
                            ),
                          ])),

                  // --------------------------------------------------------------------------------------------
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Review this place ', style: text1()),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Description',
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  errorText: like_aboute_place.isEmpty
                                      ? "please fill"
                                      : null,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  labelStyle:
                                      TextStyle(color: colorAssets.WHITE),
                                  labelText: 'Description'),
                              // maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              onChanged: (value) {
                                setState(() {
                                  like_aboute_place = value!;
                                });
                              },

                              // focusNode: _descriptionFocusNode,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a description.';
                                }
                                if (value.length < 10) {
                                  return 'Should be at least 10 characters long.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                // setState(() {
                                //   Describe_experience = value!;
                                // });
                                // _editedProduct = Product(
                                //   title: _editedProduct.title,
                                //   price: _editedProduct.price,
                                //   description: value,
                                //   imageUrl: _editedProduct.imageUrl,
                                //   id: _editedProduct.id,
                                //   isFavorite: _editedProduct.isFavorite,
                                // );
                              },
                            ),
                          ])),

                  // --------------------------------------------------------------------------------------------
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rate your Expereince here ', style: text1()),
                            const SizedBox(
                              height: 20.0,
                            ),
                            FivePointedStar(
                              gap: 4,
                              size: const Size(35, 35),
                              count: 5,
                              color: Color.fromARGB(255, 83, 83, 83),
                              selectedColor: Color.fromARGB(255, 255, 255, 255),
                              onChange: (count) {
                                setState(() {
                                  mycount = count;
                                });
                              },
                            ),
                          ])),

                  // ----------------------------------------------------------------------------------------------

                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('make your video --- ', style: text1()),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              // height: 50,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),

                              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                              child: DropdownButton<String>(
                                dropdownColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                icon: const Icon(Icons.expand_more,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                value: dropdownValueAvailabilty,
                                items: dropdownValueAvailabiltyitems
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                  );
                                }).toList(),
                                onChanged: (selectedItem) {
                                  setState(() {
                                    dropdownValueAvailabilty = selectedItem;
                                    print(dropdownValueAvailabilty);
                                  });
                                },
                              ),
                            ),
                          ])),

                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          _add_video_provider.setValue(
                            Category: dropdownCategory!,
                            Genre: dropdownValueAvailabilty!,
                            Describe_experience: Describe_experience,
                            Review_place: Review_place,
                            available: dropdownValueAvailabilty!,
                            like_aboute_place: like_aboute_place,
                            location: location,
                            rate_experience: rate_experience!,
                          );

                          await _add_video_provider.upload_Video();
                          print(_add_video_provider.VideoId);
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "SAVE DRAFT",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.orange,
                                fontWeight: FontWeight.w800,
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: !uplload_btn
                            ? () async {
                                bool? res =
                                    await _add_video_provider.save_video();
                                print("zzzzzzzzzzzzzzzz${res}");

                                if (res != null) {
                                  Navigator.pushNamed(
                                      context, success_screen.routeNamed);
                                }
                              }
                            : () {},
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                color: Colors.orange,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "PUBLISH",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            )),
                      ),
                    ],
                  ))

                  // Consumer<FormProvider>(builder: (context, model, child) {
                  //   return ElevatedButton(
                  //     onPressed: () {
                  //       if (model.validate) {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //             builder: (_) => success_page(),
                  //           ),
                  //         );
                  //       }
                  //     },
                  //     child: const Text('Submit'),
                  //   );
                  // })
                ],
              ),
            ))),
      ),
    );
  }
}
