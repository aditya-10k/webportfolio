import 'dart:async';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:custom_border/border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webportfolio2/phoneui.dart'; // your existing PhoneEmulator

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  String? selectedUrl;
  String? selectedTitle;
  String? selectedGithub;
  String _currentTime = "";
  Timer? _timer;

  // Project list
  final List<Map<String, String>> projects = [
    {
      'title': 'Exam Central',
      'siteUrl': 'https://examcentral-741f9.web.app/',
      'githubrepo': 'https://github.com/karaniheta/RUBRIX25_44_TechTonic.git',
      'icon': 'assets/icon-removebg-preview (1).png'
    },
    {
      'title': 'Anvaya',
      'siteUrl': 'https://anvaya-e628f.web.app/',
      'githubrepo': 'https://github.com/karaniheta/RUBRIX25_44_TechTonic.git',
      'icon': 'assets/applogo.png'
    },
    {
      'title': 'SVKM EduConnect',
      'siteUrl': 'https://svkm-schools.web.app/',
      'githubrepo':
          'https://play.google.com/store/apps/details?id=com.svkm.schools.svkm_schools',
      'icon': 'assets/svkm-logo.png'
    },
    {
      'title': 'Recip-Ai',
      'siteUrl': 'https://last-5609f.web.app/',
      'githubrepo': 'https://github.com/aditya-10k/RecipAi.git',
      'icon': 'assets/icon.png'
    },
    {
      'title': 'DiamondRock',
      'siteUrl': 'https://login-bcd1e.web.app/',
      'githubrepo': 'https://diamondrock.in/',
      'icon': 'assets/Diamondrock logo.png'
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'My Projects',
          style: TextStyle(
            fontFamily: 'joseB',
            fontSize: 40,
            color: Color(0xFF1E90FF),
          ),
        ),
        const SizedBox(height: 30),

        Stack(
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
                decoration: const BoxDecoration(color: Colors.black),
                child: selectedUrl == null
                    ? _buildHomeScreen()
                    : PhoneEmulator(
                        title: selectedTitle!,
                        siteUrl: selectedUrl!,
                        githubrepo: selectedGithub!,
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Back to Home button (if inside a project)
        if (selectedUrl != null)
          InkWell(
            onTap: () {
              setState(() {
                selectedUrl = null;
              });
            },
            child: CustomBorder(
              gradientBuilder: (progress) => LinearGradient(
                colors: const [
                  Color(0xFF001F54),
                  Color(0xFF1E90FF),
                  Color(0xFF1E90FF),
                ],
                transform: GradientRotation(progress * 6),
              ),
              strokeWidth: 4,
              radius: Radius.circular(20),
              animateDuration: const Duration(seconds: 5),
              animateBorder: true,
              child: BlurryContainer(
                width: 40,
                height: 40,
                // blur: 5,
                //     elevation: 10,
                //    color:  Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                child: Center(child: Icon(Icons.home_filled, color: Colors.white,)),
              ),
            ),
          ),

        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildHomeScreen() {
    return Column(
      children: [
        // Top bar with time and status icons
        Container(
          height: 25,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _currentTime,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              Row(
                children: const [
                  Icon(Icons.signal_cellular_alt,
                      color: Colors.white, size: 12),
                  SizedBox(width: 5),
                  Icon(Icons.wifi, color: Colors.white, size: 12),
                  SizedBox(width: 5),
                  Icon(Icons.battery_4_bar, color: Colors.white, size: 12),
                  SizedBox(width: 5),
                  Text("69%",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),

        // Main screen content with background
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/boliviainteligente-8H8Y5emrdO0-unsplash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // Project apps grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(11, 16, 11, 0),
                    itemCount: projects.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTitle = project['title'];
                            selectedUrl = project['siteUrl'];
                            selectedGithub = project['githubrepo'];
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(project['icon']!,
                                  fit: BoxFit.contain),
                            ),
                            //const SizedBox(height: 4),
                            Text(
                              project['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'JoseR',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDummyApp('Camera', 'assets/camera.png'),
                      _buildDummyApp('Gallery', 'assets/gallery.png'),
                      _buildDummyApp('Calculator', 'assets/calculator.png'),
                      _buildDummyApp('Settings', 'assets/settings.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDummyApp(String title, String iconPath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(iconPath, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
