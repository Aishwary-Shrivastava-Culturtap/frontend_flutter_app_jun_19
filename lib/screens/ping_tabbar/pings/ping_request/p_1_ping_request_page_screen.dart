// import 'dart:html';
import 'dart:math';

import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/model/pinds_model.dart';
import 'package:culturtap/provider/login-form-provider.dart';
import 'package:culturtap/provider/pings_provider.dart';
// import 'package:culturtap/screens/ping_tabbar/pings/ping_request/from_user/cards/c_1_pending_card.dart';
// import 'package:culturtap/screens/ping_tabbar/pings/ping_request/from_user/f_1_from_user.dart';
import 'package:culturtap/screens/ping_tabbar/pings/ping_request/p_2_return_correct_card.dart';
// import 'package:culturtap/screens/ping_tabbar/pings/ping_request/to_user/f_1_to_user.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class request_page extends StatefulWidget {
  const request_page({super.key});

  @override
  State<request_page> createState() => _request_pageState();
}

class _request_pageState extends State<request_page> {
  final _controller1 = TextEditingController();
 var _isInit = true;
  List<pings_model> _List_of_pings = [];
  late pings_provider _pings_provider;

  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  // }

   @override
  void didChangeDependencies() {
    if (_isInit) {
  
      Provider.of<pings_provider>(context).getUsers().then((_) {
       
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  // void _getData() async {
  //   try {
  //     await Provider.of<pings_provider>(context , listen: false ).getUsers();
  //     //     .then((value) {
  //     //   // _userModel = Provider.of<pings_provider>(context, listen: false).getListPings;
  //     // });
  //     // Future.delayed(const Duration(seconds: 1))
  //     //         .then((value) => setState(() async {}));
  //   } catch (e) {
  //     print(e);
  //   }
  //   // await _pings_provider.getUsers();
  //   // try {
  //   //   final _pings_provider =
       

  //   //   // _userModel = _pings_provider.getListPings;

  //   //   Future.delayed(const Duration(seconds: 1))
  //   //       .then((value) => setState(() async {}));
  //   // } catch (e) {
  //   //   print(e);
  //   // }
  // }
    Future<void> _refresh_list(BuildContext context) async{
          await  Provider.of<pings_provider>(context , listen: false).getUsers();
       
        }

  @override
  Widget build(BuildContext context) {
    _pings_provider = Provider.of<pings_provider>(context);
    _List_of_pings = _pings_provider.getListPings;

    return _List_of_pings == null || _List_of_pings!.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
                  // displacement: 250,
                  // backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  color: colorAssets.ORANGE,
                  strokeWidth: 3,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: ()   =>_refresh_list(context),
          child: SingleChildScrollView(
              child:
              
              
               Container(
                color: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child:  RefreshIndicator(
                onRefresh: ()=> _refresh_list(context),
                  child: Column(
                    children: [
                      Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          height: 70,
                          width: double.infinity,
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Total requests : ${_List_of_pings.length}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w800, fontSize: 18)),
                                button,
                              ])),
                             
                      // ------------ iterate -----------
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _List_of_pings!.length,
                        itemBuilder: (context, index) {
                          return p_2_return_correct_card(
                              card_data: _List_of_pings[index]);
                             
                          // switch  (card_data: _List_of_pings[index])
                          // request_card(
                          //   from: _userModel![index].from,
                          //   fromUser: _userModel![index].fromUser,
                          //   staus: _userModel![index].status,
                          //   title: _userModel![index].title,
                          //   to: _userModel![index].to,
                          //   toUser: _userModel![index].toUser,
                          // )
                             
                          //  Card(
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Text(_userModel![index].callId.toString()),
                          //           Text(_userModel![index].fromUser),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // )
                        },
                      )
                    ],
                  ),
                ),
                         ),
            ),
        );
  }
}

final button = TextButton(
  child: Container(
      height: 35,
      width: 140,
      // padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Pending",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700, fontSize: 20)),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 35,
          )
        ],
      )),
  style: TextButton.styleFrom(
    foregroundColor: Color(0xffFB8C00),
    textStyle: TextStyle(color: Color(0xffFB8C00), fontSize: 1),
    side: BorderSide(color: Color(0xffFB8C00), width: 1),
  ),
  onPressed: () {},
);
