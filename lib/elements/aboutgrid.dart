import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:confetti/confetti.dart';
import 'package:custom_border/border.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StaggeredGridPage extends StatefulWidget {
  @override
  State<StaggeredGridPage> createState() => _StaggeredGridPageState();
}

class _StaggeredGridPageState extends State<StaggeredGridPage> {
  late ConfettiController _confettiController;  // Declare ConfettiController

   final String viewUrl =
      "https://drive.google.com/file/d/1aLBE4syO1bHsXn_qwia1ysMWFJdwHJBS/view";
  final String downloadUrl =
      "https://drive.google.com/uc?export=download&id=1aLBE4syO1bHsXn_qwia1ysMWFJdwHJBS";


  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 2));  // Initialize ConfettiController
  }

  @override
  void dispose() {
    _confettiController.dispose();  // Dispose the ConfettiController when done
    super.dispose();
  }

    Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> tomail() async {
    final String email = "katheaditya10@gmail.com";
    final String subject = "Hello!";
    final String body = "So happy to connect!";

    final Uri mailtoLink = Uri.parse(
        "mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}");

    // Use url_launcher to launch the email client
    if (await canLaunchUrl(mailtoLink)) {
      await launchUrl(mailtoLink); // Open email client
    } else {
      throw 'Could not launch email client';
    }
    _confettiController.play();  // Start confetti animation
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 16.0;
    double spacing = 8.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: (screenWidth/2) - (padding + spacing / 2) - 20,
                height: 296,
                decoration: BoxDecoration(
                      image:
                  DecorationImage(
                    fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.dstATop,
                          ),
                    image: AssetImage('assets/boliviainteligente-8H8Y5emrdO0-unsplash.jpg')),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                          
                            'Currently pursuing my second year in engineering, I am constantly learning new technologies and staying updated with the latest trends in app/web development',
                            textAlign: TextAlign.center,
                                       style: TextStyle(fontSize:18,
                                       fontFamily: 'josesB',
                                       color: Colors.white
                                       ),),
                        ),
                      ),
                    ),
                
              ),
              SizedBox(height: 8,),
              Container(
                width: (screenWidth/2) - (padding + spacing / 2) - 20,
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                      // image:
                  // DecorationImage(
                  //   fit: BoxFit.cover,
                  //         colorFilter: ColorFilter.mode(
                  //           Colors.black.withOpacity(0.8),
                  //           BlendMode.dstATop,
                  //         ),
                  
                  //     borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text('My Resume',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'josesB'
                              ),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment : MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                          onTap: () {
                                            openUrl(viewUrl);
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
                                              width: 120,
                                              height: 40,
                                              // blur: 5,
                                              //     elevation: 10,
                                              //    color:  Colors.white.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(20),
                                              child: Center(
                                                child: Text(
                                                  'View',
                                                  style: TextStyle(
                                                      fontFamily: 'joseR', fontSize: 15, color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        InkWell(
                                          onTap: () {
                                            openUrl(downloadUrl);
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
                                              width: 120,
                                              height: 40,
                                              // blur: 5,
                                              //     elevation: 10,
                                              //    color:  Colors.white.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(20),
                                              child: Center(
                                                child: Text(
                                                  'Download',
                                                  style: TextStyle(
                                                      fontFamily: 'joseR', fontSize: 15, color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                
              ),
            ],
          ),
        
          SizedBox(width: spacing),
      
          // Right-side stacked containers
          Column(
            children: [
              Container(
                height: 196,
                width: (screenWidth / 2) - (padding + spacing / 2) - 20,
                decoration: BoxDecoration(
                  image:
              DecorationImage(
                fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8),
                        BlendMode.dstATop,
                      ),
                image: AssetImage('assets/coding.jpg')),
                
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            'Focused',
                            style: TextStyle(
                              fontFamily: 'joseB',
                              fontSize: 24,
                              color: Colors.white
                            ),
                          ),
                          Text(
                            'on',
                            style: TextStyle(
                              fontFamily: 'joseB',
                              fontSize: 24,
                              color: Color(0xFF1E90FF)
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                                'DSA , ML and AppDev oppurtinites',
                                style: TextStyle(
                                  fontFamily: 'joseR',
                                  fontSize: 14,
                                  color: Colors.white
                                ),
                              ),
                        ],
                      ),
                          SizedBox(height: 10,)
                    ],
                  ),
                )
              ),
              SizedBox(height: spacing),
              Container(
                height: 196,
                width: (screenWidth / 2) - (padding + spacing / 2) - 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8),
                        BlendMode.dstATop,
                      ),
                      image: AssetImage(
                        'assets/collab.jpg',
                      )),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Wanna collaborate?',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'joseR')),
                    Spacer(),
                    Stack(children: [
                      ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirectionality: BlastDirectionality.explosive,
                        shouldLoop: false,
                        numberOfParticles: 30,
                        gravity: 0.3,
                      ),
                      InkWell(
                        onTap: () {
                          tomail();
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
                            width: 100,
                            borderRadius: BorderRadius.circular(20),
                            child: Center(
                              child: Text(
                                'Get in touch',
                                style: TextStyle(
                                    fontFamily: 'joseR',
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
      
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
