import 'package:flutter/material.dart';
import 'package:nightlife/const/colors.dart';

class ClubPageBackground extends StatelessWidget {
  final imageURL;
  ClubPageBackground({this.imageURL});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ClipPath(
      clipper: ImageClipper(),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(imageURL),
          color: Color(0x70000000),
          colorBlendMode: BlendMode.darken,
          width: screenWidth,
          height: screenHeight * 0.55,
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0, 0);
    Offset curveEndPoint = Offset(size.width, size.height * 0.5);
    path.moveTo(curveStartingPoint.dx - 10, curveStartingPoint.dy);
    path.quadraticBezierTo(size.width * 0.2, size.width * 0.85,
        curveEndPoint.dx, curveEndPoint.dy + 10);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
