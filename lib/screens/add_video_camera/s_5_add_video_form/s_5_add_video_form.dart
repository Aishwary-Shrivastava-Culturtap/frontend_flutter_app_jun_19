import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class s_5_add_video_form extends StatefulWidget {
  const s_5_add_video_form({super.key});

  static const namedRoute = "/s_5_add_video_form";

  @override
  State<s_5_add_video_form> createState() => _s_5_add_video_formState();
}

class _s_5_add_video_formState extends State<s_5_add_video_form> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios_rounded),
                        Text(
                          'Back',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'COMPOSE',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Icon(
                      Icons.settings,
                      size: 25,
                    )
                  ],
                )),
            body: Container(
              padding: EdgeInsets.all(30),
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 35, 0, 50),
                          color: Color.fromARGB(255, 160, 159, 159),
                          height: 256,
                          width: 194,
                        ),
                      ),
                      
                      Text(
                        'EDIT',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 13),
                              child: Text(
                                'Title',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                          Container(
                            //margin: EdgeInsets.only(top:),
                            padding: EdgeInsets.all(15),
                            child:const TextField(
                              // obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange)),
                                  // labelText: 'Type here'
                                  hintText: 'Type here...',
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin:const  EdgeInsets.only(top: 40, bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Category',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    decoration:const BoxDecoration(
                                      border:  Border(
                                        bottom:    BorderSide(
                                            color: Colors.orange, width: 1),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "select",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                                EdgeInsets.only(left: 50),
                                          child: Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: Colors.orange,
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Genre',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                    padding:const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    decoration:const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.orange, width: 1),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "select",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                       const Padding(
                                          padding:
                                                EdgeInsets.only(left: 50),
                                          child: Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: Colors.orange,
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discribe your experence',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                         const Padding(
                            padding: EdgeInsets.all(15),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  hintText: 'Type here...',
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin:const EdgeInsets.fromLTRB(0, 40, 0, 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'What you Love here ?',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 17),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              padding:const EdgeInsets.fromLTRB(
                                                  20, 8, 20, 8),
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  // border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Text(
                                                'Beautiful',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                          Container(
                                              padding:const EdgeInsets.fromLTRB(
                                                  20, 8, 20, 8),
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  // border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Text(
                                                'Calm',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                          Container(
                                              padding:const EdgeInsets.fromLTRB(
                                                  20, 8, 20, 8),
                                              decoration: BoxDecoration(
                                                  color:const Color.fromARGB(
                                                      255, 35, 33, 33),
                                                  border: Border.all(
                                                      color: Colors.orange),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Text(
                                                'Party Place',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 17),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              padding:const EdgeInsets.fromLTRB(
                                                  20, 8, 20, 8),
                                              decoration: BoxDecoration(
                                                  color:const Color.fromARGB(
                                                      255, 35, 33, 33),
                                                  border: Border.all(
                                                      color: Colors.orange),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Text(
                                                'Pubs',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                          Container(
                                              padding:const EdgeInsets.fromLTRB(
                                                  20, 8, 20, 8),
                                              decoration: BoxDecoration(
                                                  color:const Color.fromARGB(
                                                      255, 35, 33, 33),
                                                  border: Border.all(
                                                      color: Colors.orange),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Text(
                                                'Resturent',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                          Container(
                                              padding:const EdgeInsets.fromLTRB(
                                                  20, 8, 20, 8),
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Text(
                                                'Others+',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                             const Padding(
                                padding: EdgeInsets.all(15),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      hintText: 'Type here...',
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                          margin:const EdgeInsets.only(bottom: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What you don’t like about this place? ',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                             const Padding(
                                padding: EdgeInsets.all(15),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      hintText: 'Type here...',
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          margin:const EdgeInsets.only(bottom: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Review this place',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                             const  Padding(
                                padding: EdgeInsets.all(15),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      hintText: 'Type here...',
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          )),
                      Text(
                        'Review this place',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          margin:const EdgeInsets.only(top: 25, bottom: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:const [
                              Icon(Icons.star_border_purple500_sharp,
                                  size: 35, color: Colors.white),
                              Icon(Icons.star_border_purple500_sharp,
                                  size: 35, color: Colors.white),
                              Icon(Icons.star_border_purple500_sharp,
                                  size: 35, color: Colors.white),
                              Icon(Icons.star_border_purple500_sharp,
                                  size: 35, color: Colors.white),
                              Icon(Icons.star_border_purple500_sharp,
                                  size: 35, color: Colors.white),
                            ],
                          )),
                      Text(
                        'Review this place',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: 150,
                            margin:const EdgeInsets.only(top: 15, bottom: 35),
                            padding:const EdgeInsets.fromLTRB(15, 11, 15, 11),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white,
                                borderRadius:
                                   const BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.remove_red_eye_outlined),
                                Text(
                                  "Private",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                               const Icon(Icons.keyboard_arrow_down_sharp),
                              ],
                            )),
                      ),
                       Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
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
                            onTap: () {},
                            child: Container(
                                padding:const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    color: Colors.orange,
                                    borderRadius:
                                      const  BorderRadius.all(Radius.circular(5))),
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
                    ]),
              ),
            )));
  }
}
