import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/style/text_style.dart';
import 'package:jp_app/src/core/utils/button.dart';
import 'package:jp_app/src/view/main_screen/pages/main_screen.dart';

class StartMenue extends StatelessWidget {
  const StartMenue({super.key});

  VoidCallback pushMainScreen(BuildContext context) {
    return () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: context.screenWidth,
      height: context.screenHeight,
      bottom: context.screenHeight * 0.05,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Feeling Snackish Today?",
                      style: header,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    Text(
                      "Explore Angi's most popular snack selection\nand get instantly happy",
                      textAlign: TextAlign.center,
                      style: headerSubText,
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    SizedBox(
                      width: context.screenWidth * 0.45,
                      height: context.screenHeight * 0.05,
                      child: FancyGlowButton(
                        onPressed: pushMainScreen(context),
                        text: "Order Now",
                        gradientBackground: [
                          Color(0xFFF69EA3),
                          Color(0xFFE970C4),
                        ],
                        innerShadow1: InnerShadow(
                          color: Color(0xFF9375B6),
                          blur: 24,
                          offset: Offset(0, -3),
                        ),
                        innerShadow2: InnerShadow(
                          color: Color(0xFFFFACE4),
                          blur: 15,
                          offset: Offset(0, 0),
                        ),
                        dropShadow: Color(0xFFEA71C5).withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
