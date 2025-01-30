import 'package:flutter/material.dart';

class Customeimage extends StatelessWidget {
  const Customeimage(
      {super.key,
      required this.imagepath,
      this.height,
      this.width,
      this.fit = BoxFit.fill});

  final String imagepath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagepath,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
