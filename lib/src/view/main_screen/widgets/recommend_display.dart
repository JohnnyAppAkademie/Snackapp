import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_app/src/core/data/snack.dart';
import 'package:jp_app/src/core/extension/media_extension.dart';
import 'package:jp_app/src/core/style/text_style.dart';
import 'package:jp_app/src/view/detail_screen/pages/detail_dialoge.dart';

class RecommendDisplay extends StatelessWidget {
  const RecommendDisplay({super.key, required this.snack});

  final Snack snack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.08,
      width: context.screenWidth * 0.40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: _showBlurredOverlay(
          context: context,
          childContent: DetailDialoge(snack: snack),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
            child: Container(
              width: 190,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1.5,
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.15),
                    const Color(0xFF908CF5).withValues(alpha: 1),
                    const Color(0xFF8c5BEA).withValues(alpha: 1),
                  ],
                  stops: [0.07, 0.61, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /* Bild */
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(snack.foodImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  /* Titel & Subtitle */
                  _buildItemInformation(snack),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// __buildItemInformation__ - Funktion
  /// <br> Baut die Snack-Informationen auf. <br>
  /// __Required__:
  /// * [Snack : snack] - Die Snackinformationen die verarbeitet werden sollen
  Widget _buildItemInformation(Snack snack) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(snack.foodName, style: headerCard),
          Text(
            snack.foodShortDescription,
            style: textCard,
            overflow: TextOverflow.clip,
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(snack.convertPriceToString(), style: cardPriceTag),
              Row(
                children: [
                  Icon(Icons.favorite_outline, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(snack.getFoodLikes.toString(), style: likesCard),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// __showBlurredOverlay__ - Funktion
  /// <br> Öffnet ein Dialoge mit Hilfe von Stack-Navigation. <br>
  /// <br> __Required__:
  /// * [BuildContent : context] - Der Context über dem der Dialoge gebaut wird
  /// * [Widget : childContent] - Das Widget was gebaut werden soll
  VoidCallback _showBlurredOverlay({
    required BuildContext context,
    required Widget childContent,
  }) {
    return () {
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                Center(child: childContent),
              ],
            ),
          );
        },
      );
    };
  }
}
