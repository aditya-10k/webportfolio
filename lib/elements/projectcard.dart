import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String siteUrl;     
  final String githubrepo;

  const ProjectCard({
    super.key,
    required this.title,
    required this.siteUrl,
    required this.githubrepo,
  });

  Future<void> _gotopage(BuildContext context) async {
    final Uri url = Uri.parse(githubrepo);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Can’t open link right now, sorry for the inconvenience!',
            style: TextStyle(fontFamily: 'JoseR', color: Colors.white),
          ),
          backgroundColor: Colors.black87,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String uniqueId = 'iframe-${siteUrl.hashCode}';

    final html.IFrameElement element = html.IFrameElement()
      ..src = siteUrl
      ..style.border = 'none'
      ..width = '100%'
      ..height = '660'
      ..setAttribute('loading', 'lazy');

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(uniqueId, (int viewId) => element);

    return InkWell(
      onTap: () => _gotopage(context),
      child: Column(
        children: [
          Container(
            width: 320,
            height: 660,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: HtmlElementView(viewType: uniqueId),
            ),
          ),
          // const SizedBox(height: 10),
          // GradientAnimationText(
          //   text: Text(
          //     title,
          //     style: const TextStyle(fontFamily: 'joseB', fontSize: 25),
          //   ),
          //   colors: const [
          //     Color(0xFF001F54),
          //     Color(0xFF1E90FF),
          //     Color(0xFF1E90FF),
          //   ],
          //   duration: const Duration(seconds: 13),
          //   transform: GradientRotation(0.6),
          // ),
        ],
      ),
    );
  }
}
