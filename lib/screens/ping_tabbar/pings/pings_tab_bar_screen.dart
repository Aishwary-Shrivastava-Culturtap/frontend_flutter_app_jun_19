// import 'package:app_api/others/message_card1.dart';
import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/trash/scroll.dart';

import 'ping_request/p_1_ping_request_page_screen.dart';
import 'message_request/message_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyPngs_tabbar(),
//     );
//   }
// }

const List<Tab> tabs = <Tab>[
  Tab(
    text: 'Requests',
  ),
  Tab(text: 'Messgages'),
  // Tab(text: 'Second'),
];

class MyPings_tabbar extends StatelessWidget {
  const MyPings_tabbar({super.key});
  static const namedRoute = "/MyPngs_tabbar";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          appBar: AppBar(
            // -----------------------  app bar ------------------

 centerTitle: true,
        leadingWidth: 100,
        backgroundColor: const Color(0xffF5F5F5),
        leading: GestureDetector(
          onTap: () {  Navigator.pop(context);
},
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Text(
                  "<",
                  style: texttype.bold29,
                ),
                // const Icon(Icons.account_circle_outlined,
                //     size: 40, color: Color.fromARGB(255, 0, 0, 0)),
                Text(
                  "Back",
                  style: texttype.bold18,
                ),
              ],
            ),
          ),
        ),
        // ========================
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sms_outlined, size: 35, color: ModalRoute.of(context)!.isCurrent?colorAssets.ORANGE:colorAssets.BLACK),
                  Text(
                    "Pings",
                    style: textstyleAssets.textstyle(myfontSize: 14.0,
                      myfontWeight: fontwightAssets.Bold,
                      mycolor: ModalRoute.of(context)!.isCurrent?colorAssets.ORANGE:colorAssets.BLACK),
                  ),
                ],
              ),
            ),
          ),
        ],
        toolbarHeight: 105,
        elevation: 0.00,
        title: Text(
          "Culturtap",
          style: texttype.reguler30,
        ),
            // -----------------------  END  ------------------

            // -----------------------  tab baar ------------------

            bottom: TabBar(
              labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800, fontSize: 20),
              indicatorWeight: 6,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              labelColor: Color(0xffFB8C00),
              indicatorColor: Color(0xffFB8C00),
              unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
              tabs: tabs,
            ),

            // -----------------------  END  -----------------
          ),
          body: const TabBarView(
            children: [
              // scroll_eg(),
              request_page(),
              message_page()
            ],

            //  tabs.map((Tab tab) {
            //   return Center(
            //     child: Text(
            //       '${tab.text!} Tab',
            //       style: Theme.of(context).textTheme.headlineSmall,
            //     ), //there are two
            //   );
            // }).toList(),
          ),
        );
      }),
    );
  }
}
