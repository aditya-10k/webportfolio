import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class StarRushBackground extends StatefulWidget {
  /// speed must be in range: 0 to 1000
  final double speed;
  final List<Color> colors;
  final double starSpeed;
  final double minRadius;
  final double maxRadius;

  const StarRushBackground({
    super.key,
    required this.speed,
    this.minRadius = 2,
    this.maxRadius = 6,
    this.colors = const [],
  }) : starSpeed = speed / 1000;

  @override
  State<StarRushBackground> createState() => _StarRushBackgroundState();
}

class _StarRushBackgroundState extends State<StarRushBackground> {
  Timer? timer;
  List<Star> stars = [];
  int numStars = 1000;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final double height = MediaQuery.of(context).size.height;
      final double width = MediaQuery.of(context).size.width;

      while (stars.length < numStars) {
        addStar(height: height, width: width);
      }

      // refresh rate of 60
      const duration = Duration(milliseconds: 1000 ~/ 60);
      timer = Timer.periodic(duration, (timer) {
        _logic(height, width);
      });
    });
  }

  void addStar({required double height, required double width}) {
    stars.add(
      Star(
        x: StarsUtils.range(0, width),
        y: StarsUtils.range(0, height),
        canvasHeight: height,
        canvasWidth: width,
        radius: StarsUtils.range(widget.minRadius, widget.maxRadius),
        color: widget.colors.isEmpty
            ? StarsUtils.generateRandomColor()
            : widget.colors[StarsUtils.rangeInt(widget.colors.length - 1)],
      ),
    );
  }

  _logic(height, width) {
    stars = stars.where((star) {
      star.update(widget.starSpeed);
      return star.isActive();
    }).toList();

    while (stars.length < numStars) {
      addStar(height: height, width: width);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarPainter(stars: stars),
    );
  }
}

class Star {
  Offset pos, prevPos, vel;
  double ang;
  double canvasHeight;
  double canvasWidth;
  Color color;
  double radius;

  Star({
    required double x,
    required double y,
    required this.canvasHeight,
    required this.canvasWidth,
    required this.radius,
    required this.color,
  })  : pos = Offset(x, y),
        prevPos = Offset(x, y),
        vel = Offset.zero,
        ang = atan2(y - (canvasHeight / 2.5), x - (canvasWidth / 2));

  bool isActive() =>
      pos.dx >= 0 &&
      pos.dx <= canvasWidth &&
      pos.dy >= 0 &&
      pos.dy <= canvasHeight;

  void update(double acc) {
    vel += Offset(cos(ang) * acc, sin(ang) * acc);
    prevPos = pos;
    pos += vel;
  }

  void draw(Canvas canvas) {
    final alpha = lerpDouble(0, 255, vel.distance / 3)!;

    final paint = Paint()
      ..color =
          alpha >= 0 && alpha <= 255 ? color.withOpacity(alpha / 255) : color
      ..strokeWidth = radius
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(pos, prevPos, paint);
  }
}

class StarsUtils {
  static final random = Random();

  static Color generateRandomColor() {
    int red = random.nextInt(156) + 100;
    int green = random.nextInt(156) + 100;
    int blue = random.nextInt(156) + 100;

    return Color.fromARGB(
      255,
      red,
      green,
      blue,
    );
  }

  static double range(double min, double max) =>
      random.nextDouble() * (max - min) + min;

  static int rangeInt(int max) => random.nextInt(max);
}

class StarPainter extends CustomPainter {
  List<Star> stars;
  StarPainter({required this.stars});

  @override
  void paint(Canvas canvas, Size size) {
    // draw the stars
    for (var s in stars) {
      s.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
