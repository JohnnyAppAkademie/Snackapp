import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_app/src/core/data/snack.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/style/text_style.dart';
import 'package:jp_app/src/core/utils/button.dart';

class SnackDisplay extends StatefulWidget {
  const SnackDisplay({super.key, required this.snack});

  final Snack snack;

  @override
  State<SnackDisplay> createState() => _SnackDisplayState();
}

class _SnackDisplayState extends State<SnackDisplay> {
  late Snack snack;

  @override
  void initState() {
    super.initState();
    snack = widget.snack;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: context.screenHeight * 0.25,
      width: context.screenWidth * 0.95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Stack(
            children: [
              /* Rating */
              Positioned(
                top: 15,
                right: 20,
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: Row(
                    children: [
                      Image(image: AssetImage("assets/graphics/star.png")),
                      SizedBox(width: context.screenWidth * 0.02),
                      Text(snack.getFoodRating.toString()),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Title */
                    SizedBox(
                      height: 30,
                      width: 225,
                      child: Text(
                        snack.getFoodName,
                        overflow: TextOverflow.ellipsis,
                        style: showcaseCardHeader,
                      ),
                    ),
                    /*  Sub-Title */
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: Text(
                        snack.getFoodShortDescription,
                        style: showcaseCardText,
                      ),
                    ),
                    /*  Preis */
                    SizedBox(
                      height: 30,
                      width: 60,
                      child: Text(
                        snack.convertPriceToString(),
                        style: showcaseCardPrice,
                      ),
                    ),
                  ],
                ),
              ),
              /*  Button */
              Positioned(
                height: 50,
                width: 160,
                top: 160,
                left: 20,
                child: FancyGlowButton(
                  onPressed: () {},
                  text: 'Add to order',
                  gradientBackground: [Color(0xFF908CF5), Color(0xFFBB8DE1)],
                  dropShadow: Color(0xFFEA71C5).withValues(alpha: 0.5),
                  innerShadow1: InnerShadow(
                    color: Color(0xFF9375B6),
                    blur: 24,
                    offset: Offset(0, -3),
                  ),
                  innerShadow2: InnerShadow(
                    color: Color(0xFFFFACE4),
                    blur: 14,
                    offset: Offset(0, -0),
                  ),
                ),
              ),
              /* Bild */
              Positioned(
                right: 2,
                bottom: -10,
                child: Image(
                  image: AssetImage(snack.foodImage),
                  height: 180,
                  width: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
