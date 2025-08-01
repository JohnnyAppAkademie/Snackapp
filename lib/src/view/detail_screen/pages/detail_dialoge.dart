import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_app/src/core/data/snack.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/style/text_style.dart';
import 'package:jp_app/src/core/utils/button.dart';

class DetailDialoge extends StatefulWidget {
  const DetailDialoge({super.key, required this.snack});
  final Snack snack;

  @override
  State<DetailDialoge> createState() => _DetailDialogeState();
}

class _DetailDialogeState extends State<DetailDialoge>
    with SingleTickerProviderStateMixin {
  late Snack snack;
  String selected = 'Small';
  int counter = 1;
  late AnimationController _controller;
  double dragOffset = 0;

  @override
  void initState() {
    super.initState();
    snack = widget.snack;
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragOffset += details.delta.dy;
      if (dragOffset < 0) dragOffset = 0;
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (dragOffset > 150) {
      _controller.forward().then((_) {
        Navigator.of(context).pop();
      });
    } else {
      _controller.reverse(from: 1.0);
      setState(() {
        dragOffset = 0;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final animationValue = _controller.value;
        final translateY = dragOffset + animationValue * context.screenHeight;

        return Transform.translate(offset: Offset(0, translateY), child: child);
      },
      child: GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        child: Stack(
          children: [
            /*  Bild  */
            _detailPicture(snack: snack),

            /* Dialoge */
            Positioned(
              width: context.screenWidth,
              height: context.screenHeight,
              bottom: 200,
              child: _detailDialoge(snack: snack),
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
              child: _additonalOptions(),
            ),

            /* Order - Button */
            Positioned(
              top: context.screenHeight * 0.85,
              left: context.screenWidth * 0.06,
              width: context.screenWidth * 0.90,
              height: context.screenWidth * 0.12,
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
        ),
      ),
    );
  }

  Widget _detailDialoge({required Snack snack}) {
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
                              : Icons.favorite_outline,
                          color: Color.fromARGB(180, 235, 235, 245),
                        ),
                      ),
                      Text(snack.foodLikes.toString(), style: detailCardText),
                    ],
                  ),
                  /* Title */
                  Text(
                    snack.foodName,
                    style: detailCardHeader,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.screenHeight * 0.0),
                  /* Subtitle */
                  Text(
                    snack.foodDescription,
                    textAlign: TextAlign.center,
                    style: detailCardText,
                  ),
                  SizedBox(height: context.screenHeight * 0.04),
                  /* Preis */
                  Text(
                    snack.convertPriceToString(),
                    style: detailCardPriceTag,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  Divider(),
                  /* Lower Text */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*  Ingredients */
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ingredients", style: detailCardText),
                          SizedBox(height: context.screenHeight * 0.02),
                          Row(
                            spacing: 2,
                            children: [
                              Image(
                                image: AssetImage("assets/icons/gluten.png"),
                                width: 20,
                                height: 20,
                              ),
                              Image(
                                image: AssetImage("assets/icons/sugar.png"),
                                width: 20,
                                height: 20,
                              ),
                              Image(
                                image: AssetImage("assets/icons/kcal.png"),
                                width: 20,
                                height: 20,
                              ),
                              Image(
                                image: AssetImage("assets/icons/lowFat.png"),
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: context.screenWidth * 0.15),
                      /* Reviews */
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Reviews", style: detailCardText),
                          SizedBox(height: context.screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                snack.foodRating < 1
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              Icon(
                                snack.foodRating < 2
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              Icon(
                                snack.foodRating < 3
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              Icon(
                                snack.foodRating < 4
                                    ? Icons.star_outlined
                                    : Icons.star,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              Icon(
                                snack.foodRating == 5
                                    ? Icons.star
                                    : Icons.star_outline,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              SizedBox(width: context.screenWidth * 0.01),
                              Text(snack.foodRating.toString()),
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

  Widget _detailPicture({required Snack snack}) {
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

  Widget _additonalOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*  Size  */
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.zero),
                  child: SegmentedButton<String>(
                    showSelectedIcon: false,
                    segments: [
                      ButtonSegment(value: "Small", label: Text("Small")),
                      ButtonSegment(value: "Medium", label: Text("Medium")),
                      ButtonSegment(value: "Large", label: Text("Large")),
                    ],
                    selected: {selected},
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        selected = newSelection.first;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.white.withValues(alpha: 0.6);
                        }
                        return Colors.white.withValues(alpha: 0.2);
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.black;
                        }
                        return Colors.white;
                      }),
                      overlayColor: WidgetStateProperty.all(Colors.white24),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      ),
                      textStyle: WidgetStateProperty.all(optionText),
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
                    shape: WidgetStatePropertyAll(
                      const CircleBorder(
                        side: BorderSide(color: Colors.white, width: 0.5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (counter > 1) counter -= 1;
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(counter.toString(), style: detailCardPriceTag),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white.withValues(alpha: 0.1),
                    ),
                    shape: WidgetStatePropertyAll(
                      const CircleBorder(
                        side: BorderSide(color: Colors.white, width: 0.5),
                      ),
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
    );
  }
}
