import 'package:flutter/material.dart';

class Diamond extends StatelessWidget {
  final DecorationImage image;
  Diamond({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: image,
      ),
    );
  }
}
