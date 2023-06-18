import 'package:camera/camera.dart';
import 'package:culturtap/mainscreen.dart';
import 'package:culturtap/provider/add_video_provider.dart';
import 'package:culturtap/provider/list_user_provider.dart';
import 'package:culturtap/provider/login-form-provider.dart';
import 'package:culturtap/provider/pings_provider.dart';
import 'package:culturtap/provider/remote_user_provider.dart';
import 'package:culturtap/provider/schedule_call_provider.dart';
import 'package:culturtap/provider/video_provider.dart';
import 'package:culturtap/screens/add_video_camera/s_1_video_screen.dart';
import 'package:culturtap/screens/add_video_camera/s_2_edit_video.dart';
import 'package:culturtap/screens/add_video_camera/s_3_video_grid.dart';
import 'package:culturtap/screens/add_video_camera/s_4_product_tems.dart';
// import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/add_video_form.dart';
// import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/form_provider.dart';
import 'package:culturtap/screens/add_video_camera/s_5_add_video_form/s_5_add_video_form.dart';
import 'package:culturtap/screens/edit_profile_screen.dart/edit_profile/c_1_profileEdit.dart';
import 'package:culturtap/screens/edit_profile_screen.dart/myEditSetting.dart';
import 'package:culturtap/screens/home/home_screen.dart';
import 'package:culturtap/screens/home/vio_detail_screen.dart';
import 'package:culturtap/screens/login_screen/auth_screen.dart';
import 'package:culturtap/screens/ping_tabbar/pings/pings_tab_bar_screen.dart';
import 'package:culturtap/screens/remote_user/profile_remote_user_screen.dart';
import 'package:culturtap/screens/remote_user/schedule_interaction_call/s_1_schedule_intr_call.dart';
import 'package:culturtap/screens/remote_user/schedule_interaction_call/schedulInterationCall_maching174.dart';
import 'package:culturtap/screens/searched_user/search_user_screen.dart';
import 'package:culturtap/trash/sampleScreen.dart';
import 'package:culturtap/trash/scroll.dart';
import 'package:culturtap/widgets/suuceess_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';

Future<void> main() async {
  // DateTime tempDate =
      // DateFormat("yyyy-MM-dd hh:mm:ss").parse("2023-02-03 06:00:00");
  // print(tempDate.);
  WidgetsFlutterBinding.ensureInitialized();
  // camera = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => video_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => login_form_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => add_video_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => schedule_call_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => list_user_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => remote_user_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => pings_provider(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => pings_provider(),
          // )

          
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.white,
          ),
          home: 
          //  const SafeArea(child:  mainscreen()),
           const SafeArea(child:  myEditSetting()),


          // scroll_eg(),
          // MyPngs_tabbar(),
          // list_user(),
          // remoteUser(),
          // matching(),
          //  s_1_schedule_intr_call(),
          // const
          // myEditSetting(),
          // AuthScreen(), add
          // ProviderFormPage(),

          // s_5_add_video_form(),
          // edit_video_screen(),
          //  video_screen(),
          routes: {
            video_detail_screen.RouteNamed: (context) => video_detail_screen(),
            s_1_video_screen.namedroute: (context) => s_1_video_screen(),
            s_2_edit_video_screen.nameroute: (context) =>
                s_2_edit_video_screen(),
            s_3_video_grid_screen_screen.namedRoute: (context) =>
                s_3_video_grid_screen_screen(),
            // s_4_videoItem.namedRoute :(context) => s_4_videoItem(clip: clip, index: index)
            s_5_add_video_form.namedRoute: (context) => s_5_add_video_form(),
            remoteUser.namedRoute: (context) => remoteUser(),
            s_1_schedule_intr_call.namedRoute: (context) =>
                s_1_schedule_intr_call(),
            MyPings_tabbar.namedRoute: (context) => MyPings_tabbar(),
            MyPings_tabbar.namedRoute: (context) => MyPings_tabbar(),
            success_screen.routeNamed: (context) => success_screen(size: 80.0)


          },
        ));
  }
}
