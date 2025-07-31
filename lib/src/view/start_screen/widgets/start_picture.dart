import 'package:flutter/material.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';

class StartPicture extends StatelessWidget {
  const StartPicture({super.key, required this.img});

  final AssetImage img;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.screenHeight * -0.15,
      bottom: 20,
      height: context.screenHeight,
      width: context.screenWidth + 200,
      child: Image(
        image: img,
        height: context.screenHeight + 200,
        width: context.screenWidth + 200,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
