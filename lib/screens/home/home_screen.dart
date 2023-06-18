import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:culturtap/screens/home/home_video_1_slider.dart';
  
class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
        child: Column(
          children: const [
            home_video_1_slider()
          ],
        ),
    
    );
  }
}
