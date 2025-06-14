import 'package:flutter/material.dart';
import 'package:webportfolio2/majestic/ui/star_rush_background.dart';
class StarRushBackgroundDemo extends StatelessWidget {
  const StarRushBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          StarRushBackground(
            speed: 10,
            maxRadius: 2,
            minRadius: 1,
            colors: [
              Colors.blue[100]!,
               Color(0xFF1E90FF),
                Color(0xFF1E90FF),
              Colors.red[200]!,
               Colors.red[200]!,
              Colors.white,
              
            ],
          ),
        ],
      ),
    );
  }
}
