 import 'package:culturtap/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
 
class home_video_1_slider extends StatefulWidget {
  const home_video_1_slider({super.key});

  @override
  State<home_video_1_slider> createState() => _home_video_1_sliderState();
}

class _home_video_1_sliderState extends State<home_video_1_slider> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF5F5F5),
      padding: EdgeInsets.all(20),
      // height: 222,
      height: 282,
      width: double.infinity,
      // width:375 ,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _builPageItem(index);
        },
      ),
    );
  }

  Widget _builPageItem(int index) {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          color: Color(0xffF5F5F5),
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 5),
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context)
                        // .pushNamed(video_detail_screen.RouteNamed);
                  },
                  child: Image.asset(
                    "assets/image/video_player.png",
                    fit: BoxFit.cover,
                  ),
                ),
                footer: Container(
                  // alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  color:const Color.fromARGB(255, 255, 255, 255),
                  height: 56,
                  child: GridTileBar(
                    backgroundColor:const Color.fromARGB(221, 255, 255, 255),
                    // leading: IconButton(
                    //         icon: Icon( Icons.favorite  ),
                    //         color: Theme.of(context).accentColor,
                    //         onPressed: () {}
                    // ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                          "Location",
                          textAlign: TextAlign.left,
                          style: texttype.blank14,
                        ),

                        SizedBox(width: 10,),
                        Flexible(
                          child: Text(
                            " HSR Layout, Sector 4",overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: texttype.medium14,
                          ),
                        )
                          ],
                        ),
                        
                       Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                          "Category",
                          textAlign: TextAlign.left,
                          style: texttype.blank14,
                        ),
                        SizedBox(width: 10,),

                        Flexible(
                          child: Text(
                            "family Visits",overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: texttype.medium14,
                          ),
                        )
                          ],
                        ),
                      ],
                    ),
                    trailing: Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 72,
                      height: 56,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:   [
                             const Icon(
                                Icons.visibility_outlined,
                                size: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                             const SizedBox(width: 6,),
                              Flexible(
                                child: Text("12", softWrap: true,overflow: TextOverflow.ellipsis,
                                    // textAlign: TextAlign.left,
                                    style: texttype.semibold14),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:const  [
                              Icon(
                                Icons.favorite,
                                size: 16,
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                              SizedBox(width: 6,),
                              Flexible(
                                child: Text("12", softWrap: true,overflow: TextOverflow.ellipsis,
                                    // textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),

          // color: Color.fromARGB(255, 0, 0, 0),
          height: 30,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.min,
            children:   [
             const Icon(Icons.turn_right, color: Color.fromARGB(255, 255, 255, 255)),
              Flexible(
                child: Text("0.7 KM",
                    // textAlign: TextAlign.left,
                    style:  textstyleAssets.textstyle(
                    myfontSize: 18.0, myfontWeight: fontwightAssets.Bold, mycolor: colorAssets.WHITE)),
              ) ],
          ),
        ),
      ),
      Align(
        // alignment: Alignment.centerRight,
        child: Container(
          alignment:const  Alignment(0.7, 0.4),
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 45,
           
            margin:const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color.fromARGB(255, 0, 0, 0),
            ),

             child:   Row(
              mainAxisSize: MainAxisSize.min,
              children:   [
                const Icon(Icons.movie_filter_outlined, color: Color.fromARGB(255, 255, 255, 255)),
                const Flexible(child: SizedBox(width: 5,)),
                Flexible(
                  child: Text("+4",overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(fontSize: 18.0, color: colorAssets.WHITE, fontWeight: fontwightAssets.ExtraBold)),
                )
              ],
                       ),
          ),
        ),
      ),
    ]);
  }
}
