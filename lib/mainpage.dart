import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:webportfolio2/elements/sizes.dart';
import 'package:webportfolio2/majestic/ui/star_rush_background.dart';
import 'package:webportfolio2/pagecontents.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

    final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(0); 
    });
  }


    void _scrollToSection(GlobalKey key) {
    final BuildContext? context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  ScrollController scrollController = ScrollController();

    @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      
      builder: (context, constraints) {  
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned.fill(
              // child: Image.asset(
              //   'assets/background.jpg',
              //   fit: BoxFit.cover, 
                
              // ),
              child: StarRushBackground(
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
            ),
            RawScrollbar(
              interactive: true,
              thumbColor: Colors.grey.withOpacity(0.15),
              thumbVisibility: true,
              radius: Radius.circular(10),
              thickness: 10,
              controller: scrollController,
              trackVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.right,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Pagecontents(homeKey: _homeKey,
                projectsKey: _projectsKey,
                contactKey: _contactKey,
                scrollController: scrollController,),
              ),
            ),
      
            constraints.maxWidth >= kMedDesktopWidth ?
                      Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width *0.3,
              child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: BlurryContainer(
                      blur: 5,
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white.withOpacity(0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {_scrollToSection(_homeKey);},
                            child: Container(
                              
                              child: Text(
                                'Home',
                                style: TextStyle(
                                  fontFamily: 'joseB',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {_scrollToSection(_projectsKey);},
                            child: Container(
                              child: Text(
                                'Projects',
                                style: TextStyle(
                                  fontFamily: 'joseB',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {_scrollToSection(_contactKey);},
                            child: Container(
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                  fontFamily: 'joseB',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            )
            :
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              //left: MediaQuery.of(context).size.width /2-50,
              child: Align(
                alignment: Alignment.topCenter,
                child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: BlurryContainer(
                        blur: 5,
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {_scrollToSection(_homeKey);},
                              child: Container(
                                
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                    fontFamily: 'joseB',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {_scrollToSection(_projectsKey);},
                              child: Container(
                                child: Text(
                                  'Projects',
                                  style: TextStyle(
                                    fontFamily: 'joseB',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {_scrollToSection(_contactKey);},
                              child: Container(
                                child: Text(
                                  'Contact',
                                  style: TextStyle(
                                    fontFamily: 'joseB',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ),
            )
          ],
        ),
      );
      }
    );
  }
}
