import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:custom_border/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:webportfolio2/elements/aboutgrid.dart';
import 'package:webportfolio2/elements/aboutgridmob.dart';
import 'package:webportfolio2/elements/sizes.dart';
import 'package:webportfolio2/projects.dart';
import 'package:webportfolio2/socials.dart';

class Pagecontents extends StatefulWidget {
  const Pagecontents(
      {super.key,
      required this.homeKey,
      required this.projectsKey,
      required this.contactKey,
      required this.scrollController});

  final GlobalKey homeKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;
  final ScrollController scrollController;

  @override
  State<Pagecontents> createState() => _PagecontentsState();
}

class _PagecontentsState extends State<Pagecontents> {
  GlobalKey aboutme = GlobalKey();
final ValueNotifier<double> _sizeNotifier = ValueNotifier(100.0);
  final ValueNotifier<double> _spacingNotifier = ValueNotifier(10.0);

  //final ScrollController _scrollController = ScrollController();

  void _scrollToAboutMe() {
    final context = aboutme.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

    void _onHover(bool isHovered) {
    _sizeNotifier.value = isHovered ? 120.0 : 100.0;
    _spacingNotifier.value = isHovered ? 20.0 : 10.0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
       builder: (BuildContext context, BoxConstraints constraints) {  
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              key: widget.homeKey,
              height: 160,
            ),
            SizedBox(
              height: 150,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'josesB', color: Colors.white, fontSize: 50),
                    children: [
                      TextSpan(
                        text: 'Crafting ',
                        style: TextStyle(
                          fontFamily: 'josesB',
                          fontSize: 50,
                        ),
                      ),
                      TextSpan(text: 'Ideas into '),
                      TextSpan(
                        text: 'Engaging ',
                        style: TextStyle(
                          fontFamily: 'josesB',
                          fontSize: 50,
                          color: Color(0xFF1E90FF),
                        ),
                      ),
                      TextSpan(text: 'Digital Experiences.')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Hello!',
                style: TextStyle(
                    fontFamily: 'joseB', fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I am',
                    style: TextStyle(
                        fontFamily: 'joseB', fontSize: 30, color: Colors.white),
                  ),
                  GradientAnimationText(
                    text: Text(
                      ' Aditya Kathe',
                      style: TextStyle(fontFamily: 'joseB', fontSize: 30),
                    ),
                    colors: [
                      Color(0xFF001F54),
                      Color(0xFF1E90FF),
                      Color(0xFF1E90FF),
                      // Color(0xFF1E90FF), const Color.fromARGB(255, 204, 25, 12)
                    ],
                    duration: Duration(seconds: 13),
                    transform: GradientRotation(0.6),
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 50,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 35,
                    fontFamily: 'josesB',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 4.0,
                          color: Colors.white,
                          offset: Offset(0, 0)),
                    ],
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FlickerAnimatedText('<Frontend developer>'),
                      FlickerAnimatedText('<AI/ML enthusiast>'),
                      FlickerAnimatedText("<Passionate Coder>"),
                      FlickerAnimatedText("<Avid Learner>"),
                    ],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 80),
            InkWell(
              onTap: () {
                _scrollToAboutMe();
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
                  width: 150,
                  height: 40,
                  // blur: 5,
                  //     elevation: 10,
                  //    color:  Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Text(
                      '✈️ About Me!',
                      style: TextStyle(
                          fontFamily: 'joseR', fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            constraints.maxWidth >= kMedDesktopWidth ?
            Container(key: aboutme, child: StaggeredGridPage())
            :Container(key: aboutme, child: StaggeredGridPageMob()),

            SizedBox(
              height: 100,
            ),
             ValueListenableBuilder(
              valueListenable: _spacingNotifier,
              builder: (context,spacing,child){
               return Wrap(
                alignment: WrapAlignment.center,
                spacing: spacing, // Dynamic spacing
                runSpacing: spacing,
                children: [
                  _buildHoverableIcon('assets/icons8-flutter-48.png'),
                  _buildHoverableIcon('assets/icons8-google-firebase-console-48.png'),
                  _buildHoverableIcon('assets/icons8-html-48.png'),
                  _buildHoverableIcon('assets/icons8-my-sql-48.png'),
                  _buildHoverableIcon('assets/icons8-numpy-48.png'),
                  _buildHoverableIcon('assets/icons8-pandas-48.png'),
                  _buildHoverableIcon('assets/icons8-python-48.png'),
                ],
                         );
              }
             ),
            const SizedBox(height: 200),
            SizedBox(
              key: widget.projectsKey,
              height: 20,
            ),
            Projects(),
            const SizedBox(height: 280),
            SizedBox(
              key: widget.contactKey,
              height: 20,
            ),
            Socials(),
            const SizedBox(height: 50),

           // PhoneEmulator()
            
          ],
        ),
      );}
    );
  }
 
  Widget _buildHoverableIcon(String assetPath) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: ValueListenableBuilder(
        valueListenable: _sizeNotifier,
        builder: (context, size, child) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: size,
            width: size,
            child: Image.asset(assetPath),
          );
        },
      ),
    );
  }
}
