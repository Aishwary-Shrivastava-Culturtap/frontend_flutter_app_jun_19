
import 'package:flutter/material.dart';

//This is a Custom Button Widget.
class CustomButton extends StatelessWidget {
	
// In the Constructor onTap and Symbol fields are added.
const CustomButton({Key? key, required this.onTap,required this.symbol}) : super(key: key);
	
// It Requires 2 fields Symbol(to be displayed)
// and onTap Function
final String symbol;
// final Function onTap();
final  Function()? onTap;

@override
Widget build(BuildContext context) {
	return GestureDetector(
		
	// The onTap Field is used here.
	onTap: onTap,
	child: Container(
		height: 60,
		width: 60,
		decoration: BoxDecoration(
		shape:  const BoxShape.rectangle(),
		color: Colors.blueGrey,
		),
		child: Center(
		child: Text(
			
			// The Symbol is used here
			symbol,
			style:const  TextStyle(
			fontSize: 35,
			fontWeight: FontWeight.bold,
			color: Colors.white,
			),
		),
		),
	),
	);
}
}
