import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_app/src/core/data/inner_shadow.dart';
import 'package:jp_app/src/core/data/snack.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/utils/fancy_button.dart';

class DetailDialoge extends StatefulWidget {
  const DetailDialoge({super.key, required this.snack});
  final Snack snack;

  @override
  State<DetailDialoge> createState() => _DetailDialogeState();
}

class _DetailDialogeState extends State<DetailDialoge> {
  late Snack snack;
  String selected = 'Small';
  int counter = 1;

  @override
  void initState() {
    super.initState();
    snack = widget.snack;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*  Bild  */
        detailPicture(snack: snack),

        /* Dialoge */
        Positioned(
          width: context.screenWidth,
          height: context.screenHeight,
          bottom: 275,
          child: detailDialoge(snack: snack),
        ),

        /*  Exit  */
        Positioned(
          top: 40,
          right: 16,
          child: IconButton(
            iconSize: 30,
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.cancel_outlined, color: Colors.white),
          ),
        ),

        /* Unteres Menü */
        Positioned(
          width: context.screenWidth,
          height: context.screenHeight,
          top: context.screenHeight * 0.75,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*  Size  */
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: SegmentedButton<String>(
                          showSelectedIcon: false,
                          segments: [
                            ButtonSegment(value: "Small", label: Text("Small")),
                            ButtonSegment(
                              value: "Medium",
                              label: Text("Medium"),
                            ),
                            ButtonSegment(value: "Large", label: Text("Large")),
                          ],
                          selected: {selected},
                          onSelectionChanged: (newSelection) {
                            setState(() {
                              selected = newSelection.first;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color?>((
                                  states,
                                ) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Colors.white.withValues(alpha: 0.6);
                                  }
                                  // Blasseres Weiß bei Nicht-Auswahl
                                  return Colors.white.withValues(alpha: 0.2);
                                }),
                            foregroundColor: WidgetStateProperty.all(
                              Colors.white,
                            ),
                            overlayColor: WidgetStateProperty.all(
                              Colors.white24,
                            ),
                            padding: WidgetStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                            textStyle: WidgetStateProperty.all(
                              TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*  Anzahl */
                  Row(
                    spacing: 10,
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (counter > 0) counter -= 1;
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(counter.toString()),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (counter < 9) counter += 1;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        /* Order - Button */
        Positioned(
          top: context.screenHeight * 0.85,
          left: context.screenWidth * 0.06,
          width: context.screenHeight * 0.40,
          child: FancyGlowButton(
            onPressed: () {},
            text: "Add to order for ${snack.convertPriceToString()}",
            gradientBackground: [Color(0xFFF69EA3), Color(0xFFE970C4)],
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
    );
  }

  Widget detailDialoge({required Snack snack}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /* Favourite  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        iconSize: 20,
                        onPressed: () {
                          setState(() {
                            snack.setFoodFavourit = !snack.getFoodFavourit;
                          });
                        },
                        icon: Icon(
                          snack.getFoodFavourit
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(snack.foodLikes.toString()),
                    ],
                  ),
                  /* Title */
                  Text(
                    snack.foodName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  /* Subtitle */
                  Text(
                    snack.foodDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.75),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  /* Preis */
                  Text(
                    snack.convertPriceToString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*  Ingredients */
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ingredients"),
                          SizedBox(height: context.screenHeight * 0.02),
                          Row(
                            spacing: 2,
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                color: Colors.white54,
                              ),
                              Icon(
                                Icons.circle_outlined,
                                color: Colors.white54,
                              ),
                              Icon(
                                Icons.circle_outlined,
                                color: Colors.white54,
                              ),
                              Icon(
                                Icons.circle_outlined,
                                color: Colors.white54,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: context.screenWidth * 0.25),
                      /* Reviews */
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Reviews"),
                          SizedBox(height: context.screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                snack.foodRating < 1
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Colors.white54,
                              ),
                              Icon(
                                snack.foodRating < 2
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Colors.white54,
                              ),
                              Icon(
                                snack.foodRating < 3
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Colors.white54,
                              ),
                              Icon(
                                snack.foodRating < 4
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Colors.white54,
                              ),
                              Icon(
                                snack.foodRating == 5
                                    ? Icons.star
                                    : Icons.star_outline,
                                color: Colors.white54,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.10),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailPicture({required Snack snack}) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          height: 350,
          child: Image.asset(snack.foodImage, fit: BoxFit.contain, scale: 250),
        ),
      ),
    );
  }
}
