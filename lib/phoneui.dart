import 'dart:async';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneEmulator extends StatefulWidget {
  final String title;
  final String siteUrl;
  final String githubrepo;

  const PhoneEmulator({
    super.key,
    required this.title,
    required this.siteUrl,
    required this.githubrepo,
  });

  @override
  _PhoneEmulatorState createState() => _PhoneEmulatorState();
}

class _PhoneEmulatorState extends State<PhoneEmulator> {
  String _currentTime = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _updateTime());

    // Register iframe once for this siteUrl
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(widget.siteUrl, (int viewId) {
      final iframe = html.IFrameElement()
        ..src = widget.siteUrl
        ..style.border = 'none'
        ..width = '315'
        ..height = '590'
        ..setAttribute('loading', 'lazy');

      return iframe;
    });
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _gotopage() async {
    final Uri url = Uri.parse(widget.githubrepo);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Unable to open GitHub link!',
            style: TextStyle(fontFamily: 'JoseR', color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/Sams.png',
            width: 330,
            fit: BoxFit.cover,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 315,
              height: 690,
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  // Top Status Bar
                  Container(
                    height: 25,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _currentTime,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Row(
                          children: [
                            Icon(Icons.signal_cellular_alt, color: Colors.white, size: 12),
                            SizedBox(width: 5),
                            Icon(Icons.wifi, color: Colors.white, size: 12),
                            SizedBox(width: 5),
                            Icon(Icons.battery_4_bar, color: Colors.white, size: 12),
                            SizedBox(width: 5),
                            Text("69%", style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
      
                  Expanded(
                    child: HtmlElementView(viewType: widget.siteUrl),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ]
    );
  }
}
