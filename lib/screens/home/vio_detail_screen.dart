import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class video_detail_screen extends StatelessWidget {
  static const RouteNamed = '/video_detail_screen';
  const video_detail_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detail"),
      ),
    );
  }
}
