import 'package:culturtap/screens/add_video_camera/s_1_video_screen.dart';
import 'package:culturtap/screens/home/home_screen.dart';
import 'package:culturtap/screens/ping_tabbar/pings/pings_tab_bar_screen.dart';
import 'package:culturtap/screens/searched_user/search_user_screen.dart';
import 'package:culturtap/widgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:culturtap/constants/constant.dart';

final heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700);
final normal = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  // int _selectedIndex = 0; //New
  int currentTap = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // final pages = [
  //   const home_screen(),
  //   const list_user(),
  //   const Page3(),
  //   const Page4(),
  // ];
  Widget currentScreen = home_screen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 67.5,
          height: 67.0,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => s_1_video_screen()),
              );
            },
            tooltip: 'add',
            child: const Icon(
              Icons.add,
              color: Color(0xffFB8C00),
              size: 30,
            ),
          ),
          //
        ),
        appBar: AppBar(
            centerTitle: true,
            leadingWidth: 100,
            backgroundColor: const Color(0xffF5F5F5),
            leading: GestureDetector(
              onTap: () {},
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
                onTap: () {
                  print("clicked!");

                  Navigator.pushNamed(context, MyPings_tabbar.namedRoute);
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // iconAssets.sms_outlined,
                      SvgPicture.asset(asset.PINGLOGO),
                      Text("Pings", style: texttype.bold14),
                    ],
                  ),
                ),
              ),
            ],
            toolbarHeight: 105,
            elevation: 0.00,
            title: SvgPicture.asset(asset.CULTURTAPLOGO)

            // Text(
            //   "Culturtap",
            //   style: texttype.reguler30,
            // )

            ),
        body: currentScreen,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = home_screen();
                      currentTap = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTap == 0
                          ? SvgPicture.asset(asset.home_filled_icons)
                          : SvgPicture.asset(asset.home_outlined_icons),

                  
                      Text(
                        "Home",
                        style: textstyleAssets.textstyle(
                          mycolor: currentTap == 0
                              ? colorAssets.ORANGE
                              : colorAssets.BLACK,
                        ),
                      )
                    ],
                  ),
                  minWidth: 40,
                ),


               
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = list_user();
                      currentTap = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTap == 1
                          ? SvgPicture.asset(asset.search_filled_icons)
                          : SvgPicture.asset(asset.search_outlined_icons),
                      Text(
                        "Search",
                        style: textstyleAssets.textstyle(
                          mycolor: currentTap == 1
                              ? colorAssets.ORANGE
                              : colorAssets.BLACK,
                        ),
                      )
                    ],
                  ),
                  minWidth: 40,
                ),
                SizedBox(width: 50,),
               
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = Page3();
                      currentTap = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTap == 2
                          ? SvgPicture.asset(asset.tripassit_filled_icons)
                          : SvgPicture.asset(asset.tripassit_outlined_icons),
                      Text(
                        "Trip Assit",
                        style: textstyleAssets.textstyle(
                          mycolor: currentTap == 2
                              ? colorAssets.ORANGE
                              : colorAssets.BLACK,
                        ),
                      )
                    ],
                  ),
                  minWidth: 40,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = Page4();
                      currentTap = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTap == 3
                          ? SvgPicture.asset(asset.setting_filled_icons)
                          : SvgPicture.asset(asset.setting_outlined_icons),
                      Text(
                        "Settings",
                        style: textstyleAssets.textstyle(
                          mycolor: currentTap == 3
                              ? colorAssets.ORANGE
                              : colorAssets.BLACK,
                        ),
                      )
                    ],
                  ),
                  minWidth: 40,
                )

                // ,Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [

                //   ],
                // )
              ],
            ),
          ),
        ),

        // buildMyNavBar(context),
        // BottomNavigationBar(
        //     selectedLabelStyle: texttype.bold14,
        //     unselectedLabelStyle: texttype.bold14,
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.home_outlined),
        //           label: 'Home',
        //           backgroundColor: Color.fromARGB(255, 255, 255, 255)),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.search),
        //           label: 'Search',
        //           backgroundColor: Color.fromARGB(255, 255, 255, 255)),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.person_2_outlined),
        //         label: 'trip assitent',
        //         backgroundColor: Color.fromARGB(255, 255, 255, 255),
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.settings_suggest_outlined),
        //         label: 'Profile',
        //         backgroundColor: Color.fromARGB(255, 255, 255, 255),
        //       ),
        //     ],
        //     type: BottomNavigationBarType.fixed,
        //     currentIndex: _selectedIndex,
        //     selectedItemColor: const Color(0xffFB8C00),
        //     unselectedItemColor: Colors.black,
        //     iconSize: 40,
        //     onTap: _onItemTapped,
        //     elevation: 5),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: const Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: colorAssets.ORANGE,
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: const Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: colorAssets.ORANGE,
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: const Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: colorAssets.ORANGE,
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: const Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: colorAssets.ORANGE,
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
