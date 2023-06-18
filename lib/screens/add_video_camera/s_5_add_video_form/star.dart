import 'package:flutter/material.dart';
import 'package:five_pointed_star/five_pointed_star.dart';

class mystar extends StatefulWidget {
  const mystar({super.key});

  @override
  State<mystar> createState() => _mystarState();
}

class _mystarState extends State<mystar> {
  int mycount = 0;

  @override
  Widget build(BuildContext context) {
    return FivePointedStar(gap:4 ,size: const Size(35, 35),
       count :5,
       color:Color.fromARGB(255, 83, 83, 83),
         selectedColor  :  Color.fromARGB(255, 255, 255, 255),

      onChange: (count) {
        setState(() {
          mycount = count;
        });
      },
    );
  }
}
