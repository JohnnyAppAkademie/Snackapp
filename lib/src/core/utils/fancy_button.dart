import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_app/src/core/data/inner_shadow.dart';

class FancyGlowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final List<Color> gradientBackground;
  final InnerShadow innerShadow1;
  final InnerShadow innerShadow2;
  final Color dropShadow;

  const FancyGlowButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.gradientBackground,
    required this.innerShadow1,
    required this.innerShadow2,
    required this.dropShadow,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          // Background with glow and gradients
          Positioned.fill(
            child: CustomPaint(
              painter: _FancyButtonPainter(
                gradientBackground: gradientBackground,
                shadow1: innerShadow1,
                shadow2: innerShadow2,
                dropShadow: dropShadow,
              ),
            ),
          ),
          // Foreground text
          Positioned.fill(
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.transparent,
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FancyButtonPainter extends CustomPainter {
  final List<Color> gradientBackground;
  final InnerShadow shadow1;
  final InnerShadow shadow2;
  final Color dropShadow;

  _FancyButtonPainter({
    required this.gradientBackground,
    required this.shadow1,
    required this.shadow2,
    required this.dropShadow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final borderRadius = 16.0;
    final rect = Offset.zero & size;
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    // Background gradient
    final gradientPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 2.5,
        colors: gradientBackground,
      ).createShader(rect);

    canvas.drawRRect(rRect, gradientPaint);

    // Inner shadows
    _drawInnerShadow(canvas, rRect, shadow1);
    _drawInnerShadow(canvas, rRect, shadow2);

    // Drop shadow
    canvas.save();
    canvas.translate(0, 12); // move down
    final shadowPaint = Paint()
      ..color = dropShadow
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 30);
    canvas.drawRRect(rRect, shadowPaint);
    canvas.restore();
  }

  void _drawInnerShadow(Canvas canvas, RRect rRect, InnerShadow shadow) {
    final path = Path()..addRRect(rRect);

    canvas.saveLayer(rRect.outerRect.inflate(shadow.blur), Paint());
    canvas.translate(shadow.offset.dx, shadow.offset.dy);

    final shadowPaint = Paint()
      ..color = shadow.color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow.blur)
      ..blendMode = BlendMode.srcIn;

    canvas.drawPath(path, shadowPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
