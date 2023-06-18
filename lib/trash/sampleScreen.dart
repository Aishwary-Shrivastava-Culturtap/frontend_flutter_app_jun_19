import 'package:culturtap/widgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class samplescreen extends StatelessWidget {

  static const namedRoute = "/samplescreen";
  const samplescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // body: ,
      appBar: appbar_with_back(onPressedBack: () {
        
      },
      onPressedPing: () {
        
      }),
    ));
  }
}
