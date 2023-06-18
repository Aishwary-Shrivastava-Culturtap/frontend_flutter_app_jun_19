import 'dart:math';
import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/provider/login-form-provider.dart';
import 'package:culturtap/screens/home/home_screen.dart';
// import 'package:culturtap/screens/login_screen/custom_form_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:culturtap/model/http_exception.dart';
import 'package:location/location.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController _pageController = PageController();
  // OtpFieldController otpController = OtpFieldController();
  // final countrycodepicker = const FlCountryCodePicker();

  // CountryCode? countryCode;
  late int otpcode;

  // Map<String?, String?> authData = {
  //   'name': '',
  //   'PhoneNo': '',
  // };
  // var _isLoading = false;
  final _nameController = TextEditingController();
  final _phonenoController = TextEditingController();
  // final _otpController = TextEditingController();
  final _mapController = TextEditingController();
  var otpController = List.generate(4, (index) => TextEditingController());

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  bool button1nameActive = false;
  bool button2numberActive = false;
  bool button3otpActive = false;
  bool button4mapActive = false;

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  double? longitude;
  double? latitude;

  // Future<void> _submit() async {
  //   // if (!_formKey1.currentState!.validate() &&
  //   //     !_formKey2.currentState!.validate() &&
  //   //     !_formKey3.currentState!.validate() &&
  //   //     !_formKey4.currentState!.validate()) {
  //   //   return;
  //   // }
  //   // _formKey1.currentState!.save();
  //   // _formKey2.currentState!.save();
  //   // _formKey3.currentState!.save();
  //   // _formKey4.currentState!.save();

  //   final prefs = await SharedPreferences.getInstance();

  //   final userData = json.encode(
  //     {
  //       'name': _nameController.text,
  //       'PhoneNo': _phonenoController.text,
  //       // 'uid': Auth().uid,
  //     },
  //   );
  //   prefs.setString('userData', userData);
  //   // setState(() {
  //   //   _isLoading = true;
  //   // });
  //   try {
  //     // if (_authMode == AuthMode.Login) {
  //     //   // Log user in
  //     // } else {
  //     //   // Sign user up
  //     // }
  //   } on HttpException catch (error) {
  //     var errorMessage = 'Authentication failed';
  //     if (error.toString().contains('EMAIL_EXISTS')) {
  //       errorMessage = 'This email address is already in use.';
  //     } else if (error.toString().contains('INVALID_EMAIL')) {
  //       errorMessage = 'This is not a valid email address';
  //     } else if (error.toString().contains('WEAK_PASSWORD')) {
  //       errorMessage = 'This password is too weak.';
  //     } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
  //       errorMessage = 'Could not find a user with that email.';
  //     } else if (error.toString().contains('INVALID_PASSWORD')) {
  //       errorMessage = 'Invalid password.';
  //     }
  //     _showErrorDialog(errorMessage);
  //   } catch (error) {
  //     const errorMessage =
  //         'Could not authenticate you. Please try again later.';
  //     _showErrorDialog(errorMessage);
  //   }

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  // void _switchAuthMode() {
  //   if (_authMode == AuthMode.Login) {
  //     setState(() {
  //       _authMode = AuthMode.Signup;
  //     });
  //   } else {
  //     setState(() {
  //       _authMode = AuthMode.Login;
  //     });
  //   }
  // }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    login_form_provider _login_form_provider =
        Provider.of<login_form_provider>(context);

    _mapController.text = "${_login_form_provider.latitude.toString()} -- ${_login_form_provider.longitude.toString()}";

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            // -----------------------  app bar ------------------

 centerTitle: true,
        leadingWidth: 100,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),


//         leading: GestureDetector(
//           onTap: () {  Navigator.pop(context);
// },
//           child: Container(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                   Text(
//                   "<",
//                   style: texttype.bold29,
//                 ),
//                 // const Icon(Icons.account_circle_outlined,
//                 //     size: 40, color: Color.fromARGB(255, 0, 0, 0)),
//                 Text(
//                   "Back",
//                   style: texttype.bold18,
//                 ),
//               ],
//             ),
//           ),
//         ),
        // ========================
        // actions: [
        //   GestureDetector(
        //     onTap: () {},
        //     child: Container(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Icon(Icons.sms_outlined, size: 35, color: ModalRoute.of(context)!.isCurrent?colorAssets.ORANGE:colorAssets.BLACK),
        //           Text(
        //             "Pings",
        //             style: textstyleAssets.textstyle(myfontSize: 14.0,
        //               myfontWeight: fontwightAssets.Bold,
        //               mycolor: ModalRoute.of(context)!.isCurrent?colorAssets.ORANGE:colorAssets.BLACK),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
        toolbarHeight: 105,
        elevation: 0.00,
        title: SvgPicture.asset(  asset.CULTURTAPLOGO 
        ),
            // -----------------------  END  ------------------
  
          ),
          body: Form(
          key: _formKey,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              // #####################################   1 screen          ###############
              Container(
                height: 700,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ----------- image---------------

                      Center(
                        child: SvgPicture.asset(
                        asset.img1,
                          height: 300,
                        ),
                      ),
                      // ------------------------------------------------------------------

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
                              // --------------- indicater-----------
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Color.fromARGB(255, 255, 141, 59),
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(Icons.crop_16_9_rounded,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(50, 6, 20, 0),
                              child:const  Text('SIGNUP ',
                                  style: textAssets.Blank18,)
                            ),
                            Container(
                               padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
                              child:const Text(' Explore, Update, Guid & Earn ! ',
                                  style: textAssets.Regular16),
                            ),

                            Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // ),==============================================

                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 16, 50, 3),
                                    child:const Text('Please enter your ',
                                        style: textAssets.SemiBold16),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 3, 50, 10),
                                    child:const Text('Name ',
                                        style: textAssets.Regular14),
                                  ),
                                ]),
                            // -----------------------------  textform -------------

                            Column(
                              children: <Widget>[
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  child: TextFormField(
                                    controller: _nameController,
                                    decoration:
                                        InputDecoration(labelText: 'Name'),
                                    textInputAction: TextInputAction.next,
                                    // onFieldSubmitted: (value) {
                                    //   FocusScope.of(context).requestFocus(_numberFocusNode);
                                    // },
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value!.isValidNamee) {
                                        return 'please enter value';
                                      }
                                      return null;
                                    },

                                    onChanged: (newValue) {
                                      print("1111");
                                      if (newValue!.isValidNamee) {
                                        setState(() {
                                          button1nameActive = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 3, 0, 10),
                                      child: Text(' Already User ?  ',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 19)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 3, 0, 10),
                                      child: Text('Sign in',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 19,
                                              color: Color.fromARGB(
                                                  255, 255, 141, 59))),
                                    )
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  height: 70, //height of button
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _login_form_provider
                                            .setName(_nameController.text);

                                        _pageController.nextPage(
                                            duration:
                                                Duration(microseconds: 500),
                                            curve: Curves.linear);
                                      },
                                      child: Text(
                                        'NEXT',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: !button1nameActive
                                            ? Colors.black
                                            : Color.fromARGB(255, 255, 141, 59),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      // ------------------------------------------------------------------
                    ],
                  ),
                ),
              ),

              // #####################################   2 screen          ###############
              Container(
                height: 700,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ----------- image---------------

                      Center(
                        child: Image(
                          image: AssetImage(
                            'assets/2/car.png',
                          ),
                          height: 300,
                        ),
                      ),
                      // ------------------------------------------------------------------

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
                              // --------------- indicater-----------
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Color.fromARGB(255, 255, 141, 59),
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(Icons.crop_16_9_rounded,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _login_form_provider.printdetail();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 6, 50, 10),
                                child: Text('SIGNUP ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22)),
                              ),
                            ),
                            Container(
                              // alignment: Alignment(0, 7),
                              padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
                              child: Text(' Start Your Adventure Now ! ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19)),
                            ),

                            Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // ),==============================================

                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 16, 50, 10),
                                    child: Text('Please enter your ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 10, 50, 10),
                                    child: Text('Mobile Number ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ]),
                            // -----------------------------  textform -------------

                            Column(
                              children: <Widget>[
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  child: TextFormField(
                                    controller: _phonenoController,
                                    // focusNode: _numberFocusNode,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(labelText: 'Number'),
                                    textInputAction: TextInputAction.next,
                                    // onFieldSubmitted: (value) {
                                    //   FocusScope.of(context).requestFocus(_OTPFocusNode);
                                    // },
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value.isValidPhonee) {
                                        return 'please enter value';
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      if (newValue!.isValidPhonee) {
                                        setState(() {
                                          button2numberActive = true;
                                        });
                                      }
                                    },
                                    onChanged: (newValue) {
                                      print("onChanged function");
                                      _login_form_provider
                                          .setPhoneNo(_phonenoController.text);

                                      // print("222");
                                      if (newValue!.isValidPhonee) {
                                        setState(() {
                                          button2numberActive = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  height: 70, //height of button
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _login_form_provider.getotp();

                                      // _login_form_provider.printdetail();

                                      _pageController.nextPage(
                                          duration: Duration(microseconds: 500),
                                          curve: Curves.linear);
                                    },
                                    child: Text(
                                      'NEXT',
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: !button2numberActive
                                            ? Colors.black
                                            : Color.fromARGB(
                                                255, 255, 144, 92)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      // ------------------------------------------------------------------
                    ],
                  ),
                ),
              ),
              // #####################################   3 screen          ###############
              Container(
                height: 700,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ----------- image---------------

                      Center(
                        child: Image(
                          image: AssetImage(
                            'assets/3/lap.png',
                          ),
                          height: 300,
                        ),
                      ),
                      // ------------------------------------------------------------------

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
                              // --------------- indicater-----------
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Color.fromARGB(255, 255, 141, 59),
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(Icons.crop_16_9_rounded,
                                      color: Colors.black),
                                ],
                              ),
                            ),

                            Container(
                              // alignment: Alignment(0, 7),
                              padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
                              child: Text('Earn By Assisting Nearby Turists ! ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19)),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(50, 6, 50, 10),
                              child: Text('Enter OTP ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22)),
                            ),
                            Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // ),==============================================

                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 16, 50, 10),
                                    child: Text('it should be autofilled ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 10, 50, 10),
                                    child: Text('or type manually ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ]),
                            // -----------------------------  textform -------------

                            //                       Column(
                            //                         children: <Widget>[
                            //                           Container(
                            // color: Colors.amber,
                            // height: 300,
                            // width: double.infinity,
                            // child:

                            Column(
                              children: [
                                Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: List.generate(
                                        4,
                                        (index) => Container(
                                              width: 70,
                                              height: 140,
                                              child: TextField(
                                                controller:
                                                    otpController[index],
                                                onChanged: (value) {
                                                  if (value.length == 1 &&
                                                      index <= 2) {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  }
                                                  // else if (value.isEmpty && index > 0) {
                                                  //   FocusScope.of(context).nextFocus();
                                                  // }
                                                },
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    height: 2.0,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    filled: true,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              width: 2.0),
                                                    ),
                                                    border: InputBorder.none,
                                                    fillColor: Color.fromARGB(
                                                        255, 233, 233, 233),
                                                    hintText: "*"),
                                              ),
                                            ))),

                                // Container(
                                //   padding:
                                //       const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                //   child: TextFormField(
                                //     controller: _otpController,
                                //     // focusNode: _OTPFocusNode,
                                //     keyboardType: TextInputType.number,
                                //     decoration:
                                //         InputDecoration(labelText: 'OTP'),
                                //     textInputAction: TextInputAction.next,
                                //     // onFieldSubmitted: (value) {
                                //     //   FocusScope.of(context).requestFocus(_mapFocusNode);
                                //     // },
                                //     validator: (value) {
                                //       if (value!.isEmpty || value!.isValidOTP) {
                                //         return 'please enter value';
                                //       }
                                //       return null;
                                //     },

                                //     onChanged: (newValue) {
                                //       print("333");

                                //       setState(() {
                                //         otpcode = int.parse(newValue);
                                //       });
                                //     },
                                //   ),
                                // ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 3, 0, 10),
                                      child: Text(" Didn't receive it ?  ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 19)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 3, 0, 10),
                                      child: Text('RESEND',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 19,
                                              color: Color.fromARGB(
                                                  255, 255, 141, 59))),
                                    )
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  height: 70, //height of button
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        print("onpressed -  otp");

                                        try {
                                          String tempotp = otpController[0]
                                                  .text
                                                  .toString() +
                                              otpController[1].text.toString() +
                                              otpController[2].text.toString() +
                                              otpController[3].text.toString();
                                          print(tempotp);
                                          print(int.parse(tempotp));

                                          if (int.parse(tempotp) ==
                                              _login_form_provider.getotpcode) {
                                            print("inside  if else");

                                            _login_form_provider.getlocationn();

                                            setState(() {
                                              button3otpActive = true;
                                            });

                                            _pageController.nextPage(
                                                duration:
                                                    Duration(microseconds: 500),
                                                curve: Curves.linear);
                                          }
                                        } catch (e) {
                                          print(e);
                                        }
                                      },
                                      child: Text(
                                        'NEXT',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: !button3otpActive
                                            ? Colors.black
                                            : Color.fromARGB(255, 255, 141, 59),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      // ------------------------------------------------------------------
                    ],
                  ),
                ),
              ),
              // #####################################   4 screen          ###############
              Container(
                height: 700,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ----------- image---------------

                      Center(
                        child: Image(
                          image: AssetImage(
                            'assets/5/map.png',
                          ),
                          height: 300,
                        ),
                      ),
                      // ------------------------------------------------------------------

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
                              // --------------- indicater-----------
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Color.fromARGB(255, 255, 141, 59),
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(
                                    Icons.crop_16_9_rounded,
                                    color: Colors.black,
                                  ),
                                  Icon(Icons.crop_16_9_rounded,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(50, 6, 50, 10),
                              child: Text('SIGNUP ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22)),
                            ),
                            Container(
                              // alignment: Alignment(0, 7),
                              padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
                              child: Text(' Explore, Update, Guid & Earn ! ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19)),
                            ),
                            // -----------------------------  textform -------------

                            Column(
                              children: <Widget>[
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  child: _login_form_provider.latitude == null?CircularProgressIndicator():
                                  
                                  TextFormField(
                                    controller: _mapController,
                                    // focusNode:_mapFocusNode,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        labelText: 'Map',
                                        hintText: "${_login_form_provider.longitude}, ${_login_form_provider.longitude}"),
                                    textInputAction: TextInputAction.next,
                                    // onFieldSubmitted: (value) {
                                    //   FocusScope.of(context).requestFocus(_numberFocusNode);
                                    // },
                                    validator: (value) {
                                      if (value!.isEmpty || value!.isValidMap) {
                                        return 'please enter value';
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      if (newValue!.isValidNamee) {
                                        setState(() {
                                          button1nameActive = true;
                                        });
                                      }
                                    },
                                    onChanged: (newValue) {
                                      print("444");
                                      if (newValue!.isValidMap) {
                                        setState(() {
                                          button4mapActive = true;
                                        });
                                      }
                                    },
                                  ),



                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _pageController.jumpToPage(0);
                                  },
                                  child: Container(
                                    // alignment: Alignment(0, 7),
                                    padding:
                                        const EdgeInsets.fromLTRB(50, 3, 0, 10),
                                    child: Text('go back ',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 19)),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  height: 70, //height of button
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                      
                                      },
                                      child: Text(
                                        'NEXT',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: !button4mapActive
                                            ? Colors.black
                                            : Color.fromARGB(255, 255, 141, 59),
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _login_form_provider.getlocationn();
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    color: Colors.red,
                                    child: Text("click to retry"),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                      // ------------------------------------------------------------------
                    ],
                  ),
                ),
              ),
              // ####################################################################
            ],
          ),
        ));
  }

  // void printlocation() async {
  //   Location location = new Location();
  //   _locationData = await location.getLocation();

  //   print("${_locationData.latitude} ${_locationData.longitude}");
  // }
}

extension extString on String {
  // bool get map {
  //   // final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //   // return emailRegExp.hasMatch(this);
  // }

  bool get isValidNamee {
    if (this.length > 4) {
      return true;
    } else {
      return false;
    }

    // final nameRegExp =  new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    // return nameRegExp.hasMatch(this);
  }

  bool get isValidPhonee {
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final phoneRegExp = RegExp(pattern);
    if (this.length == 10 && phoneRegExp.hasMatch(this)) {
      return true;
    } else {
      print("false");
      return false;
    }
  }

  bool get isValidOTP {
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final phoneRegExp = RegExp(pattern);
    if (this.length == 4 && phoneRegExp.hasMatch(this)) {
      return true;
    } else {
      print("false");
      return false;
    }
  }

  bool get isValidMap {
    if (this.length > 4) {
      return true;
    } else {
      return false;
    }
  }

  bool get isNotNull {
    return this != null;
  }
}
