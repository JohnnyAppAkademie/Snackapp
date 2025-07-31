import 'package:flutter/material.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/view/start_screen/widgets/start_menue.dart';
import 'package:jp_app/src/view/start_screen/widgets/start_outline.dart';
import 'package:jp_app/src/view/start_screen/widgets/start_picture.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/bg_startscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // 2. Eis-Charakter
            StartPicture(img: AssetImage('assets/graphics/cupcake_chick.png')),
            // 3. Outlined Snack-Text
            StartOutline(),
            // 4. Menü
            StartMenue(),
          ],
        ),
      ),
    );
  }
}
