import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Socials extends StatefulWidget {
  const Socials({super.key});

  @override
  State<Socials> createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  Future<void> launcher(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My ',
                  style: TextStyle(
                    fontFamily: 'joseB',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Socials',
                  style: TextStyle(
                    fontFamily: 'joseB',
                    color: Color(0xFF1E90FF),
                    fontSize: 30,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      launcher('https://www.instagram.com/_adityx10_/');
                    },
                    icon: Icon(
                      SuperIcons.bs_instagram,
                      color: Color(0xFF1E90FF),
                    )),
                IconButton(
                    onPressed: () {
                      launcher('https://github.com/aditya-10k');
                    },
                    icon: Icon(
                      SuperIcons.bs_github,
                      color: Color(0xFF1E90FF),
                    )),
                InkWell(
                  child: IconButton(
                      onPressed: () {
                        launcher(
                            'https://www.linkedin.com/in/aditya-kathe-47a650273/');
                      },
                      icon: Icon(
                        SuperIcons.bs_linkedin,
                        color: Color(0xFF1E90FF),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
