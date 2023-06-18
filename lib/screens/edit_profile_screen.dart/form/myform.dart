// import 'package:flutter/material.dart';

// class myform extends StatelessWidget {
//   const myform({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Form Validation Demo';

//     return const MyCustomForm();
//   }
// }

// // Create a Form widget.
// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

 
// class MyCustomFormState extends State<MyCustomForm> {
 
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//      return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//              validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                  if (_formKey.currentState!.validate()) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Processing Data')),
//                   );
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


                  // NOTE
//========================================
// this is form example without controller