import 'package:flutter/material.dart';

class SnookerBall extends StatelessWidget {
  final Function onTap;
  final Color color;
  final int? score;

  const SnookerBall({super.key, required this.onTap, this.color = Colors.blue, this.score});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.10;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipPath(
        clipper: CircleClipper(),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () => onTap(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background with color and grain texture
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [color, Colors.black87],
                      center: const Alignment(-0.2, -0.3),
                      radius: 0.8,
                    ),
                  ),
                ),
                score != null ?  Text("$score", style: const TextStyle(color: Colors.white),) : const SizedBox.shrink()
                // Grain effect overlay
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}