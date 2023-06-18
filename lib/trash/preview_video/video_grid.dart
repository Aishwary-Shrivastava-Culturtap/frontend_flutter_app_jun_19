import 'package:culturtap/trash/preview_video/product_tems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 
class video_grid extends StatelessWidget {
  final bool showFavs = true;

 
  @override
  Widget build(BuildContext context) {
     return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 2,
      itemBuilder: (ctx, i) => videoItem(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}