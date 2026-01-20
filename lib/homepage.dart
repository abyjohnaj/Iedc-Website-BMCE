import 'package:flutter/material.dart';
import 'package:iedc_web/sections/upevetemp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/newsletter_section.dart';
import 'package:iedc_web/sections/video_hero.dart';
import 'package:iedc_web/sections/custom_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, _opacity),
        leadingWidth: 300,
        leading: SizedBox(
          width: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/IEDC  LOGO.png'),
              ),
              if (screenWidth > 600)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "IEDC",
                      style: TextStyle(
                        color: Color.fromRGBO(15, 72, 106, 1.0),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    Text(
                      "Innovation and Entreprenuership ",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "Development Centre, BMCE",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )
            ],
          ),
        ),

        actions: [
          if (screenWidth > 800)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _navButton("HOME", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                }),
                _navButton("EUREKA", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NewsletterSection()));
                }),
                _navButton("COLLABORATION", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CollaborationSection()));
                }),
                _navButton("IDEABOX", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const IdeaBoxSection()));
                }),
                _navButton("INCUBATION", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Incubation()));
                }),
                _navButton("CONTACT US", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ContactSection()));
                }),
              ],
            )
          else
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(15, 72, 106, 1.0),
              ),
              onSelected: (value) {
                switch (value) {
                  case "HOME":
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomePage()));
                    break;
                  case "EUREKA":
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const NewsletterSection()));
                    break;
                  case "COLLABORATION":
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const CollaborationSection()));
                    break;
                  case "IDEABOX":
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const IdeaBoxSection()));
                    break;
                  case "INCUBATION":
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Incubation()));
                    break;
                  case "CONTACT US":
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ContactSection()));
                    break;
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(value: "HOME", child: Text("HOME")),
                PopupMenuItem(value: "EUREKA", child: Text("EUREKA")),
                PopupMenuItem(value: "COLLABORATION", child: Text("COLLABORATION")),
                PopupMenuItem(value: "IDEABOX", child: Text("IDEABOX")),
                PopupMenuItem(value: "INCUBATION", child: Text("INCUBATION")),
                PopupMenuItem(value: "CONTACT US", child: Text("CONTACT US")),
              ],
            ),
        ],
      ),

      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            double offset = scrollNotification.metrics.pixels;
            setState(() {
              _opacity = (offset / 200).clamp(0, 1);
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoHero(
                videoPath:
                    "https://res.cloudinary.com/df2tpx1ld/video/upload/v1757951989/IMG_8344_symvha.mp4",
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    Text(
                      "Upcoming Events",
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: "Anton",
                        fontSize: screenWidth > 600 ? 50 : 28,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Upevetemp(),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () async {
                        await _launchUrl(
                          "https://whatsapp.com/channel/0029Vb6yfNNI7BeJhuSzYL1y",
                        );
                      },
                      child: const Text(
                        "Click to know more about Events",
                        style: TextStyle(
                          color: Colors.amber,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromRGBO(15, 72, 106, 1.0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
