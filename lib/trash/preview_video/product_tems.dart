import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 
class videoItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // videoItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
 
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
 
          },
          child:
           Image.asset(
            "assets/image/img2.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
                  icon: Icon(
                    Icons.favorite  ,
                  ), 
                  onPressed: () {  
                  },
                ),
   
          title: Text(
            "product",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {

            },
           ),
        ),
      ),
    );
  }
}