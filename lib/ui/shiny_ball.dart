import 'package:flutter/material.dart';

class ShinyBall extends StatelessWidget {
  final Color color;
  final Function onTap;

  const ShinyBall({super.key, this.color = Colors.red, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.01 ;
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue,
      child: SizedBox(
        height: size,
        child: CustomPaint(
          size: Size(size, size),
          painter: ShinyBallPainter(color),
        ),
      ),
    );
  }
}

class ShinyBallPainter extends CustomPainter {
  final Color color;

  ShinyBallPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, color.withOpacity(0.5), Colors.white.withOpacity(0.2)],
        stops: [0.0, 0.7, 1.0],
        center: Alignment(-0.3, -0.3),
        radius: 0.8,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2))
      ..style = PaintingStyle.fill;

    // Draw the ball
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Add a highlight
    final highlightPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.white.withOpacity(0.8), Colors.transparent],
        stops: [0.0, 1.0],
        center: Alignment(-0.4, -0.4),
        radius: 0.4,
      ).createShader(Rect.fromCircle(center: Offset(size.width / 3, size.height / 3), radius: size.width / 4));

    canvas.drawCircle(Offset(size.width / 3, size.height / 3), size.width / 4, highlightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
