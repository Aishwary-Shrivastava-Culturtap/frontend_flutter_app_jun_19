import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/model/search_user_model.dart';
import 'package:culturtap/provider/list_user_provider.dart';
import 'package:culturtap/provider/remote_user_provider.dart';
import 'package:culturtap/screens/remote_user/schedule_interaction_call/s_1_schedule_intr_call.dart';
import 'package:culturtap/widgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

final t1withbold = textstyleAssets.textstyle(
    myfontSize: 18.0, myfontWeight: fontwightAssets.ExtraBold);
final t2 = textstyleAssets.textstyle(
    myfontSize: 18.0, myfontWeight: fontwightAssets.Regular);

class remoteUser extends StatelessWidget {
  remoteUser({super.key});
  static const namedRoute = "/remoteUser";

  // var loadedremoteUser;

  // var _remote_user_provider;

  // var user_id;

  // void initState() {
  @override
  Widget build(BuildContext context) {
    final _remote_user_provider;
    final user_id = ModalRoute.of(context)!.settings.arguments as int;

    final loadedremoteUser = Provider.of<list_user_provider>(
      context,
      listen: false,
    ).findById(user_id);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<remote_user_provider>(context, listen: false)
          .setuser(loadedremoteUser);

      print("setuser");
    });

    return SafeArea(
      child: Scaffold(
        // appBar: myAppBar(
        //   onPressedBack: () {},
        //   onPressedPing: () {},
        // ),
        body: loadedremoteUser == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Center(
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
                                      child: Container(
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
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(asset.AVATAR,
                                                height: 132, width: 132),
                                            Text("${loadedremoteUser.name}"),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
    
                        Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.perm_identity,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 21,
                                  ),
                                  Text(
                                    '${loadedremoteUser.followers} followers',
                                    style: t1withbold,
                                  ),
                                  // const Text('25 min'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.person_add_alt,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  Text('${loadedremoteUser.followings} Following',
                                      style: t1withbold),
                                  // const Text('1 hr'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.add_location_outlined,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  Text(
                                      '${loadedremoteUser.locationFollow!.length} Location',
                                      style: t1withbold),
                                  // const Text('4-6'),
                                ],
                              ),
                            ],
                          ),
                        ),
    
                        Center(
                            child: Column(children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(30),
                            child: Table(
                              // textDirection: TextDirection.rtl,
                              // defaultColumnWidth: FixedColumnWidth(120.0),
                              // border: TableBorder.all(
                              //     color: Colors.black,
                              //     style: BorderStyle.solid,
                              //     width: 2),
                              children: [
                                TableRow(children: [
                                  Text(
                                    'Place - ',
                                    style: t1withbold,
                                  ),
                                  Text(
                                    '${loadedremoteUser.address}',
                                    style: t2,
                                  ),
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Profession - ',
                                    style: t1withbold,
                                  ),
                                  Text(
                                    '${loadedremoteUser.profession}',
                                    style: t2,
                                  ),
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Age / Gender - ',
                                    style: t1withbold,
                                  ),
                                  Text(
                                    '24 Yr / ${loadedremoteUser.gender}',
                                    style: t2,
                                  ),
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Language - ',
                                    style: t1withbold,
                                  ),
                                  Text(
                                    '${loadedremoteUser.languageSpeak}',
                                    style: t2,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ])),
    
                        // ------------------------------------------------
    
                        Container(
                          width: double.infinity,
    
                          padding: const EdgeInsets.all(50),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 8,
                            ), //Border.all
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 198, 198, 198),
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ), //Offset
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          height: 369,
                          // width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Expert Card",
                                    style: t1withbold,
                                  ),
                                  Icon(
                                    Icons.share_rounded,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  )
                                ],
                              )),
                              Container(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Expert in location - ",
                                        style: t1withbold,
                                      ),
                                      Text(
                                        "${loadedremoteUser.locationFollow!.toList()}",
                                        style: t2,
                                      )
                                    ],
                                  )),
                              Container(
                                  child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Visited Places - ",
                                    style: t1withbold,
                                  ),
                                  Text(
                                      "${loadedremoteUser.locationFollow!.toList()}",
                                      style: t2)
                                ],
                              )),
                              Container(
                                  child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Covered Location - ",
                                    style: t1withbold,
                                  ),
                                  Text("NA", style: t2)
                                ],
                              )),
                              Container(
                                  child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Expertise Rating - ",
                                    style: t1withbold,
                                  ),
                                  Text("NA", style: t2)
                                ],
                              )),
                              Container(
                                  child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Your Culture Status",
                                    style: t1withbold,
                                  ),
                                  Text("NA", style: t2)
                                ],
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                    // #########################################################################
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "${loadedremoteUser.name}’s provided avilable time for tripplanning interaction calls -",
                            style: t1withbold,
                            softWrap: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.schedule)),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                      "${loadedremoteUser.availableTime![0]}  - ${loadedremoteUser.availableTime![1]} ",
                                      style: texttype.t3)),
                              Expanded(
                                  flex: 4, child: Text("  India", style: t2)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.alarm)),
                              Expanded(
                                flex: 6,
                                child: Text(
                                    "${loadedremoteUser.pendingRequests} already pending requests for interaction with Hemant",
                                    style: t2),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Cost of trip Planning Call",
                            style: t2,
                          ),
                          Text(
                            cost.COST_TRIP_PLANNING_CALL,
                            style: t1withbold,
                          ),
                          custom_button(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  s_1_schedule_intr_call.namedRoute,
                                  arguments: user_id,
                                );
                              },
                              text: "Schedual trip Planning Call"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

// class user_thumbnail extends StatelessWidget {
//   const user_thumbnail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return }
// }

class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
    // required this.condition,
    required this.onTap,
    required this.text,
  });
  // final bool condition;
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                height: 40, //height of button
                // width: , //width of button
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            colorAssets.ORANGE, //background color of button
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        padding: EdgeInsets.fromLTRB(
                            20, 6, 20, 6) //content padding inside button
                        ),
                    onPressed: onTap,
                    child: Text(text,
                        style: textstyleAssets.textstyle(
                            myfontSize: 18.0,
                            myfontWeight: fontwightAssets.SemiBold,
                            mycolor: colorAssets.WHITE))))));
  }
}
