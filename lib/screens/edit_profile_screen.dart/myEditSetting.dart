


// import 'package:edit_profile/edit_profile/banner/banner.dart';
// import 'package:edit_profile/edit_profile/follower.dart';
// import 'package:edit_profile/edit_profile/profileEdit.dart';
// import 'package:edit_profile/edit_profile/visitors.dart';
// import 'package:edit_profile/form/form.dart';
// import 'package:edit_profile/edit_profile/banner/toggelbutton-2.dart';
// import 'package:edit_profile/edit_profile/banner/toggelbutton-3.dart';
// import 'package:edit_profile/edit_profile/banner/toggelbutton.dart';
// import 'package:edit_profile/edit_profile/visitors.dart';
// import 'package:edit_profile/popups/popup1.dart';
// import 'package:edit_profile/edit_profile/expert_card.dart';
// import 'package:edit_profile/edit_profile/follower.dart';
// import 'package:edit_profile/edit_profile/profileEdit.dart';
// import 'package:edit_profile/fetch_detail_from.dart';
// import 'package:edit_profile/form/form.dart';
// import 'package:edit_profile/form/myform.dart';
// import 'package:edit_profile/time/setTime.dart';
import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/screens/edit_profile_screen.dart/edit_profile/c_1_profileEdit.dart';
import 'package:culturtap/screens/edit_profile_screen.dart/edit_profile/follower.dart';
import 'package:culturtap/screens/edit_profile_screen.dart/fetch_detail_from.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

   class myEditSetting extends StatelessWidget {
  const myEditSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
//     Container();
//   }
// }
        
        Scaffold(
          appBar: AppBar(
            centerTitle: true,

            leadingWidth: 100,
            // centerTitle: true,
            backgroundColor:const Color.fromARGB(255, 255, 255, 255),

            leading: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                 const  Text(
                    "<",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            // ========================
            actions: [
              Container(
                // padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  // this method can help you to set picture for end
                  children: [
                    SvgPicture.asset(
                          asset.PINGLOGO,
                          semanticsLabel: 'culturtap Logo'
                        ),
                    TextButton(
                      child: const Text(
                        "Pings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],

            toolbarHeight: 105,
            elevation: 0.00,

            title:Image.asset(
                          asset.CULTURTAPLOGO,
                          semanticLabel: 'culturtap Logo'
                        )

          ),

          // ==============================================
 
          body:
 
              ListView(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            children: [
               profile_edit(),
              iconList,
              fetch_data(),
              //  form_dropout(),
              //  expert_card,

              // SwitchScreen(),
              // toggel2(),
              // toggel3(),
              // // popup1(),

              // visitsGreating,
            ],
          ),
        );

        // ---
  }
}