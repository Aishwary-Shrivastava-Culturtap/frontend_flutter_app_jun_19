import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class api {
  // static const BASE_URL = 'http://0.0.0.0:8000';
  static const BASE_URL = 'http://172.21.17.179:8000';

  static const USER_GET = '/user/get';
  static const USER_UPDATE = '/user/update/';

  // -----------------   cals ----------------
  static const CALL_GET = '/call/get';
  static const CALL_ADD = '/call/add';
  static const CALL_DELETE = "/call/delete/";
  static const CALL_UPDATE = "/call/update";

  // -----------------   video ----------------
  static const GET_VIDEO = '/videos/get/video/';
  static const SAVE_VIDEO = '/videos/add-video?';
  static const ADD_VIDEO_DETAIL = '/videos/add';
}

class asset {
  // ------------    login   -----------------------
  static const img1 = 'assets/login/img1.svg';
  static const img2 = 'assets/login/img2.svg';
  static const img3 = 'assets/login/img3.svg';
  static const img4 = 'assets/login/img4.svg';

  static const CULTURTAPLOGO = 'assets/culturtap_logo.svg';
  static const PINGLOGO = 'assets/ping.svg';
  static const AVATAR = 'assets/editprofile/person-profile-edit.svg';
  static const MOBILE_EDIT_PROFILE = 'assets/mobile-edit-card.svg';
  static const popup_schedule_call =
      "assets/schedule_call/popup_schedule_call.svg";

  // ------------------home
  static const home_filled_icons = 'assets/home_icons/home_filled_icon.svg';
  static const home_outlined_icons = 'assets/home_icons/home_outlined_icon.svg';

  static const search_filled_icons = 'assets/home_icons/search_filled_icon.svg';
  static const search_outlined_icons =
      'assets/home_icons/search_outlined_icon.svg';

  static const tripassit_filled_icons =
      'assets/home_icons/trip_filled_icon.svg';
  static const tripassit_outlined_icons =
      'assets/home_icons/trip_outlined_icon.svg';

  static const setting_filled_icons =
      'assets/home_icons/setting_filled_icon.svg';
  static const setting_outlined_icons =
      'assets/home_icons/setting_outlined_icon.svg';
}

//
class colorAssets {
  static const ORANGE = Color(0xffFB8C00);
  static const WHITE = Colors.white;
  static const BLACK = Colors.black;
  static const RED = Color(0xffFF0000);
  static const GREEN = Color(0xff0A8100);
}

class fontwightAssets {
  static const Thin = FontWeight.w100;
  static const ExtraLight = FontWeight.w200;
  static const Light = FontWeight.w300;
  static const Regular = FontWeight.w400;
  static const Medium = FontWeight.w500;
  static const SemiBold = FontWeight.w600;
  static const Bold = FontWeight.w700;
  static const ExtraBold = FontWeight.w800;
  static const Blank = FontWeight.w900;
}

// -------------------------------------------------------------------

class textAssets {
  //16
  static const Regular16 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18.0,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: fontwightAssets.Regular,
  );
  //18
  static const Blank18 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22.0,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: fontwightAssets.Blank,
  );
  //16
  static const SemiBold16 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18.0,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: fontwightAssets.SemiBold,
  );
  //14
  static const Regular14 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18.0,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: fontwightAssets.Regular,
  );
}

// -------------------------------------------------------------------

class textstyleAssets {
  static textstyle(
      {myfontSize = 14.0,
      myfontWeight = FontWeight.w400,
      mycolor = Colors.black}) {
    return GoogleFonts.poppins(
        fontSize: myfontSize, fontWeight: myfontWeight, color: mycolor);
  }
}

class iconAssets {
  static const person_circuler = Icon(Icons.account_circle_rounded,
      size: 40, color: Color.fromARGB(255, 0, 0, 0));

  static const sms_outlined =
      Icon(Icons.sms_outlined, size: 35, color: Color.fromARGB(255, 0, 0, 0));
}

class texttype {
  static final bold14 = textstyleAssets.textstyle(
      myfontSize: 14.0, myfontWeight: fontwightAssets.Bold);

  static final bold18 = textstyleAssets.textstyle(
      myfontSize: 18.0, myfontWeight: fontwightAssets.Bold);

  static final bold29 = GoogleFonts.poppins(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontSize: 29.0,
      fontWeight: fontwightAssets.Bold);

  static final semibold14 = textstyleAssets.textstyle(
      myfontSize: 14.0, myfontWeight: fontwightAssets.SemiBold);
  static final extrabold18 = textstyleAssets.textstyle(
      myfontSize: 18.0, myfontWeight: fontwightAssets.ExtraBold);

  static final blank14 = textstyleAssets.textstyle(
      myfontSize: 14.0, myfontWeight: fontwightAssets.Bold);
  static final medium14 = textstyleAssets.textstyle(
      myfontSize: 14.0, myfontWeight: fontwightAssets.Medium);

  static final reguler30 = GoogleFonts.rammettoOne(
      color: colorAssets.ORANGE,
      fontWeight: fontwightAssets.Regular,
      fontSize: 30);

  // static final bold14 = textstyleAssets.textstyle(
  //     myfontSize: 14.0, myfontWeight: fontwightAssets.Bold);
  // ===========================================================
  static final t1 = textstyleAssets.textstyle(
      myfontSize: 20.0, myfontWeight: fontwightAssets.ExtraBold);
// ----------------------------------------------------------------

  static t2(
      {color = colorAssets.BLACK,
      myfontSize = 18.0,
      myfontWeight = fontwightAssets.Bold}) {
    return textstyleAssets.textstyle(
        mycolor: color, myfontSize: myfontSize, myfontWeight: myfontWeight);
  }
// ----------------------------------------------------------------

  static final t3 = textstyleAssets.textstyle(
      myfontSize: 18.0, myfontWeight: fontwightAssets.Regular);
// ----------------------------------------------------------------
  static final t4 = textstyleAssets.textstyle(
    mycolor: colorAssets.WHITE,
    myfontSize: 16.0,
    myfontWeight: fontwightAssets.Regular,
  );

  static final t5 = textstyleAssets.textstyle(
      mycolor: colorAssets.WHITE,
      myfontSize: 16.0,
      myfontWeight: fontwightAssets.Bold);
}

class cost {
  static const String COST_TRIP_PLANNING_CALL = "500";
}

// SvgPicture.asset(
//   assetName,
//   semanticsLabel: 'Acme Logo'
// );

//Image.assets(
//'assets/img/logo.png',
// height:50;
// weight: 40,
//)
