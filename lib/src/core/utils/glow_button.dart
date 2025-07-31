import 'package:flutter/material.dart';

class GlowButton extends StatelessWidget {
  /// __GlowButton__ - Konstruktor
  /// <br> Erstellt einen GlowButton-Container. <br>
  /// <br>__Required__:
  /// * Der Titel des Buttons [String: title]
  /// * Funktion des Buttons  [VoidCallback: buttonCall]
  /// * Gradient für Outer Shadow [Gradient: outerGradiant]
  /// * Color für den Box Glow [Color: boxGlow]
  /// * Color für den Inner Shadow [List<Color>: innerGradiantColours]
  const GlowButton({
    super.key,
    required this.title,
    required this.buttonCall,
    required this.outerGradient,
    required this.innerGradientColours,
    required this.boxGlow,
  });

  final String title;
  final VoidCallback buttonCall;
  final Gradient outerGradient;
  final List<Color> innerGradientColours;
  final Color boxGlow;

  @override
  Widget build(BuildContext context) {
    return
    /* Outer Shadow */
    Container(
      decoration: BoxDecoration(
        gradient: outerGradient,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: boxGlow,
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      /* Button */
      child: TextButton(
        onPressed: buttonCall,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
