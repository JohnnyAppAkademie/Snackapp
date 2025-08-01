import 'package:flutter/material.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';

class StartOutline extends StatelessWidget {
  const StartOutline({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.screenHeight * 0.60,
      right: context.screenWidth * 0.10,
      child: SizedBox(
        child: Stack(
          children: [
            // Outline (Kontur)
            Text(
              'Snack Snack',
              maxLines: 1,
              style: TextStyle(
                fontSize: 125,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.white60,
              ),
            ),
            // Transparenter Fülltext
            Text(
              'Snack Snack',
              maxLines: 1,
              style: TextStyle(fontSize: 125, color: Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
