// import 'dart:math';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';
//  import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:fl_country_code_picker/fl_country_code_picker.dart';
// import 'package:culturtap/model/http_exception.dart';
// class AuthScreen extends StatefulWidget {
//   const AuthScreen({
//     Key? key,
//   }) : super(key: key);
//   static const routeName = '/auth';

//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final _formKey = GlobalKey<FormState>();

//   PageController _pageController = PageController();
//   OtpFieldController otpController = OtpFieldController();
//   final countrycodepicker = const FlCountryCodePicker();

//   CountryCode? countryCode;
//   Map<String?, String?> authData = {
//     'name': '',
//     'PhoneNo': '',
//   };
//   var _isLoading = false;
//   final _nameController = TextEditingController();
//   final _phonenoController = TextEditingController();
//   final _otpController = TextEditingController();
//   final _mapController = TextEditingController();

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('An Error Occurred!'),
//         content: Text(message),
//         actions: <Widget>[
//           ElevatedButton(
//             child: Text('Okay'),
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _submit() async {
//     // if (!_formKey1.currentState!.validate() &&
//     //     !_formKey2.currentState!.validate() &&
//     //     !_formKey3.currentState!.validate() &&
//     //     !_formKey4.currentState!.validate()) {
//     //   return;
//     // }
//     // _formKey1.currentState!.save();
//     // _formKey2.currentState!.save();
//     // _formKey3.currentState!.save();
//     // _formKey4.currentState!.save();

//     final prefs = await SharedPreferences.getInstance();

//     final userData = json.encode(
//       {
//         'name': _nameController.text,
//         'PhoneNo': _phonenoController.text,
//         // 'uid': Auth().uid,
//       },
//     );
//     prefs.setString('userData', userData);
//     // setState(() {
//     //   _isLoading = true;
//     // });
//     try {
//       // if (_authMode == AuthMode.Login) {
//       //   // Log user in
//       // } else {
//       //   // Sign user up
//       // }
//     } on HttpException catch (error) {
//       var errorMessage = 'Authentication failed';
//       if (error.toString().contains('EMAIL_EXISTS')) {
//         errorMessage = 'This email address is already in use.';
//       } else if (error.toString().contains('INVALID_EMAIL')) {
//         errorMessage = 'This is not a valid email address';
//       } else if (error.toString().contains('WEAK_PASSWORD')) {
//         errorMessage = 'This password is too weak.';
//       } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
//         errorMessage = 'Could not find a user with that email.';
//       } else if (error.toString().contains('INVALID_PASSWORD')) {
//         errorMessage = 'Invalid password.';
//       }
//       _showErrorDialog(errorMessage);
//     } catch (error) {
//       const errorMessage =
//           'Could not authenticate you. Please try again later.';
//       _showErrorDialog(errorMessage);
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   // void _switchAuthMode() {
//   //   if (_authMode == AuthMode.Login) {
//   //     setState(() {
//   //       _authMode = AuthMode.Signup;
//   //     });
//   //   } else {
//   //     setState(() {
//   //       _authMode = AuthMode.Login;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Color.fromARGB(255, 255, 255, 255),
//           toolbarHeight: 105,
//           elevation: 0.00,
//           title: Image.asset(
//             'img/1/logo.png',
//             fit: BoxFit.cover,
//             height: 48.75,
//             width: 156,
//           ),
//         ),
//         // resizeToAvoidBottomInset: false,
//         body:Form(
//           key: _formKey, PageView(
//           controller: _pageController,
//           children: [
//             // #####################################   1 screen          ###############
//             Container(
//               height: 700,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // ----------- image---------------

//                     Center(
//                       child: Image(
//                         image: AssetImage(
//                           'img/1/girl.png',
//                         ),
//                         height: 300,
//                       ),
//                     ),
//                     // ------------------------------------------------------------------

//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
//                             // --------------- indicater-----------
//                             child: Row(
//                               children: const [
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Color.fromARGB(255, 255, 141, 59),
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(Icons.crop_16_9_rounded,
//                                     color: Colors.black),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 6, 50, 10),
//                             child: Text('SIGNUP ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w900, fontSize: 22)),
//                           ),
//                           Container(
//                             // alignment: Alignment(0, 7),
//                             padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
//                             child: Text(' Explore, Update, Guid & Earn ! ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w400, fontSize: 19)),
//                           ),

//                           Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 // ),==============================================

//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 16, 50, 10),
//                                   child: Text('Please enter your ',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600)),
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   child: Text('Name ',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400)),
//                                 ),
//                               ]),
//                           // -----------------------------  textform -------------

//                           Form(
//                             key: _formKey1,
//                             child: Column(
//                               children: <Widget>[
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   child: TextFormField(
//                                     decoration:
//                                         InputDecoration(labelText: 'Name'),
//                                     obscureText: true,
//                                     controller: _nameController,
//                                     validator: (value) {
//                                       if (value!.isEmpty || value!.length < 0) {
//                                         return 'Name is too short!';
//                                       }
//                                     },
//                                     onSaved: (value) {
//                                       authData['Name'] = value;
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           50, 3, 0, 10),
//                                       child: Text(' Already User ?  ',
//                                           style: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 19)),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           40, 3, 0, 10),
//                                       child: Text('Sign in',
//                                           style: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 19,
//                                               color: Color.fromARGB(
//                                                   255, 255, 141, 59))),
//                                     )
//                                   ],
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   height: 70, //height of button
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       _pageController.nextPage(
//                                           duration: Duration(microseconds: 500),
//                                           curve: Curves.linear);
//                                     },
//                                     child: Text(
//                                       'NEXT',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.w900,
//                                           color: Color.fromARGB(
//                                               255, 255, 255, 255)),
//                                     ),
//                                     style: ButtonStyle(
//                                       backgroundColor: MaterialStateProperty
//                                           .resolveWith<Color>(
//                                         (Set<MaterialState> states) {
//                                           if (states
//                                               .contains(MaterialState.disabled))
//                                             return Color.fromARGB(255, 0, 0, 0);
//                                           return Color.fromARGB(255, 255, 141,
//                                               59); // Use the component's default.
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     // ------------------------------------------------------------------
//                   ],
//                 ),
//               ),
//             ),

//             // #####################################   2 screen          ###############
//             Container(
//               height: 700,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // ----------- image---------------

//                     Center(
//                       child: Image(
//                         image: AssetImage(
//                           'img/2/car.png',
//                         ),
//                         height: 300,
//                       ),
//                     ),
//                     // ------------------------------------------------------------------

//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
//                             // --------------- indicater-----------
//                             child: Row(
//                               children: const [
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Color.fromARGB(255, 255, 141, 59),
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(Icons.crop_16_9_rounded,
//                                     color: Colors.black),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 6, 50, 10),
//                             child: Text('SIGNUP ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w900, fontSize: 22)),
//                           ),
//                           Container(
//                             // alignment: Alignment(0, 7),
//                             padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
//                             child: Text(' Start Your Adventure Now ! ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w400, fontSize: 19)),
//                           ),

//                           Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 // ),==============================================

//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 16, 50, 10),
//                                   child: Text('Please enter your ',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600)),
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   child: Text('Mobile Number ',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400)),
//                                 ),
//                               ]),
//                           // -----------------------------  textform -------------

//                           Form(
//                             key: _formKey2,
//                             child: Column(
//                               children: <Widget>[
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   child: TextFormField(
//                                     keyboardType: TextInputType.number,
//                                     maxLines: 1,
//                                     decoration: InputDecoration(
//                                         prefixIcon: GestureDetector(
//                                           onTap: () async {
//                                             final code = await countrycodepicker
//                                                 .showPicker(context: context);
//                                             setState(() {
//                                               countryCode = code;
//                                             });
//                                           },
//                                           child: Container(
//                                             // width: 50,
//                                             // padding: const EdgeInsets.symmetric(
//                                             //   horizontal: 16,
//                                             //   vertical: 6,
//                                             // ),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 const Icon(Icons.phone_iphone),
//                                                 const SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 Text(countryCode?.dialCode ??
//                                                     "+00"),
//                                                 const SizedBox(
//                                                     // width: 10,
//                                                     ),
//                                                 Icon(Icons.expand_more),
//                                                 const SizedBox(
//                                                   width: 30,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         labelText: 'Phone number'),
//                                     obscureText: true,
//                                     controller: _phonenoController,
//                                     validator: (value) {
//                                       if (value!.isEmpty || value!.length < 0) {
//                                         return 'Phone number is too short!';
//                                       }
//                                     },
//                                     onSaved: (value) {
//                                       authData['PhoneNo'] = value;
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   height: 70, //height of button
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       _pageController.nextPage(
//                                           duration: Duration(microseconds: 500),
//                                           curve: Curves.linear);
//                                     },
//                                     child: Text(
//                                       'NEXT',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.w900,
//                                           color: Color.fromARGB(
//                                               255, 255, 255, 255)),
//                                     ),
//                                     style: ButtonStyle(
//                                       backgroundColor: MaterialStateProperty
//                                           .resolveWith<Color>(
//                                         (Set<MaterialState> states) {
//                                           if (states
//                                               .contains(MaterialState.disabled))
//                                             return Color.fromARGB(255, 0, 0, 0);
//                                           return Color.fromARGB(255, 255, 141,
//                                               59); // Use the component's default.
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     // ------------------------------------------------------------------
//                   ],
//                 ),
//               ),
//             ),
//             // #####################################   3 screen          ###############
//             Container(
//               height: 700,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // ----------- image---------------

//                     Center(
//                       child: Image(
//                         image: AssetImage(
//                           'img/3/lap.png',
//                         ),
//                         height: 300,
//                       ),
//                     ),
//                     // ------------------------------------------------------------------

//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
//                             // --------------- indicater-----------
//                             child: Row(
//                               children: const [
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Color.fromARGB(255, 255, 141, 59),
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(Icons.crop_16_9_rounded,
//                                     color: Colors.black),
//                               ],
//                             ),
//                           ),

//                           Container(
//                             // alignment: Alignment(0, 7),
//                             padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
//                             child: Text('Earn By Assisting Nearby Turists ! ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w400, fontSize: 19)),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 6, 50, 10),
//                             child: Text('Enter OTP ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w900, fontSize: 22)),
//                           ),
//                           Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 // ),==============================================

//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 16, 50, 10),
//                                   child: Text('it should be autofilled ',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600)),
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   child: Text('or type manually ',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400)),
//                                 ),
//                               ]),
//                           // -----------------------------  textform -------------

//                           Form(
//                             key: _formKey3,
//                             child: Column(
//                               children: <Widget>[
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   child: OTPTextField(
//                                       controller: otpController,
//                                       length: 4,
//                                       width: MediaQuery.of(context).size.width,
//                                       textFieldAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       fieldWidth: 45,
//                                       fieldStyle: FieldStyle.box,
//                                       outlineBorderRadius: 15,
//                                       style: TextStyle(fontSize: 17),
//                                       onChanged: (pin) {
//                                         print("Changed: " + pin);
//                                       },
//                                       onCompleted: (pin) {
//                                         print("Completed: " + pin);
//                                       }),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           50, 3, 0, 10),
//                                       child: Text(" Didn't receive it ?  ",
//                                           style: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 19)),
//                                     ),
//                                     Container(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           40, 3, 0, 10),
//                                       child: Text('RESEND',
//                                           style: GoogleFonts.poppins(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 19,
//                                               color: Color.fromARGB(
//                                                   255, 255, 141, 59))),
//                                     )
//                                   ],
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   height: 70, //height of button
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       _pageController.nextPage(
//                                           duration: Duration(microseconds: 500),
//                                           curve: Curves.linear);
//                                     },
//                                     child: Text(
//                                       'NEXT',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.w900,
//                                           color: Color.fromARGB(
//                                               255, 255, 255, 255)),
//                                     ),
//                                     style: ButtonStyle(
//                                       backgroundColor: MaterialStateProperty
//                                           .resolveWith<Color>(
//                                         (Set<MaterialState> states) {
//                                           if (states
//                                               .contains(MaterialState.disabled))
//                                             return Color.fromARGB(255, 0, 0, 0);
//                                           return Color.fromARGB(255, 255, 141,
//                                               59); // Use the component's default.
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     // ------------------------------------------------------------------
//                   ],
//                 ),
//               ),
//             ),
//             // #####################################   4 screen          ###############
//             Container(
//               height: 700,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // ----------- image---------------

//                     Center(
//                       child: Image(
//                         image: AssetImage(
//                           'img/5/map.png',
//                         ),
//                         height: 300,
//                       ),
//                     ),
//                     // ------------------------------------------------------------------

//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 2, 50, 9),
//                             // --------------- indicater-----------
//                             child: Row(
//                               children: const [
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Color.fromARGB(255, 255, 141, 59),
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(
//                                   Icons.crop_16_9_rounded,
//                                   color: Colors.black,
//                                 ),
//                                 Icon(Icons.crop_16_9_rounded,
//                                     color: Colors.black),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(50, 6, 50, 10),
//                             child: Text('SIGNUP ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w900, fontSize: 22)),
//                           ),
//                           Container(
//                             // alignment: Alignment(0, 7),
//                             padding: const EdgeInsets.fromLTRB(50, 3, 0, 10),
//                             child: Text(' Explore, Update, Guid & Earn ! ',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w400, fontSize: 19)),
//                           ),
//                           // -----------------------------  textform -------------

//                           Form(
//                             key: _formKey4,
//                             child: Column(
//                               children: <Widget>[
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   child: TextFormField(
//                                     decoration:
//                                         InputDecoration(labelText: 'Map'),
//                                     obscureText: true,
//                                     controller: _mapController,
//                                     validator: (value) {
//                                       if (value!.isEmpty || value!.length < 0) {
//                                         return 'Map is too short!';
//                                       }
//                                     },
//                                     // onSaved: (value) {
//                                     //   _authData['password'] = value;
//                                     // },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     _pageController.jumpToPage(0);
//                                   },
//                                   child: Container(
//                                     // alignment: Alignment(0, 7),
//                                     padding:
//                                         const EdgeInsets.fromLTRB(50, 3, 0, 10),
//                                     child: Text('go back ',
//                                         style: GoogleFonts.poppins(
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 19)),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(50, 10, 50, 10),
//                                   height: 70, //height of button
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       _submit();
//                                       Auth().authenticate(
//                                           name: "xxx",
//                                            phoneno: 1231231231  ,
//                                           address: "xxx");
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => home_screen(),
//                                           ));
//                                     },
//                                     child: Text(
//                                       'Done',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.w900,
//                                           color: Color.fromARGB(
//                                               255, 255, 255, 255)),
//                                     ),
//                                     style: ButtonStyle(
//                                       backgroundColor: MaterialStateProperty
//                                           .resolveWith<Color>(
//                                         (Set<MaterialState> states) {
//                                           if (states
//                                               .contains(MaterialState.disabled))
//                                             return Color.fromARGB(255, 0, 0, 0);
//                                           return Color.fromARGB(255, 255, 141,
//                                               59); // Use the component's default.
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     // ------------------------------------------------------------------
//                   ],
//                 ),
//               ),
//             ),
//             // ####################################################################
//           ],
//         ));
//   }
// }
