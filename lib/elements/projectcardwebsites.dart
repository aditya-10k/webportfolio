import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWebsites extends StatelessWidget {
  final String title;
  final String imagePath;
  final String githubrepo;

  const ProjectCardWebsites({
    super.key,
    required this.title,
    required this.imagePath,
    required this.githubrepo,
  });

  Future<void> _gotopage() async {
    final Uri url = Uri.parse(githubrepo);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // You can use ScaffoldMessenger to show the snackbar if needed
      debugPrint('Cannot open link: $githubrepo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _gotopage,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                height: 290,
                width: 650,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GradientAnimationText(
            text: Text(
              title,
              style: const TextStyle(fontFamily: 'joseB', fontSize: 25),
            ),
            colors: const [
              Color(0xFF001F54),
              Color(0xFF1E90FF),
              Color(0xFF1E90FF),
            ],
            duration: const Duration(seconds: 13),
            transform: GradientRotation(0.6),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
