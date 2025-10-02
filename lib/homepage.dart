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
              if (screenWidth > 600) // hide logo text on small screens
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
                    Text("Innovation and Entreprenuership ", style: TextStyle(fontSize: 10)),
                    Text("Development Centre, BMCE", style: TextStyle(fontSize: 10)),
                  ],
                )
            ],
          ),
        ),
        title: screenWidth > 800
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _navButton("HOME", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  }),
                  _navButton("EUREKA", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsletterSection()));
                  }),
                  _navButton("COLLABORATION", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CollaborationSection()));
                  }),
                  _navButton("IDEABOX", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const IdeaBoxSection()));
                  }),
                  _navButton("INCUBATION", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Incubation()));
                  }),
                  _navButton("CONTACT US", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactSection()));
                  }),
                ],
              )
            : PopupMenuButton<String>(
                icon: const Icon(Icons.menu, color: Color.fromRGBO(15, 72, 106, 1.0)),
                onSelected: (value) {
                  switch (value) {
                    case "HOME":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                      break;
                    case "EUREKA":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsletterSection()));
                      break;
                    case "COLLABORATION":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CollaborationSection()));
                      break;
                    case "IDEABOX":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const IdeaBoxSection()));
                      break;
                    case "INCUBATION":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Incubation()));
                      break;
                    case "CONTACT US":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactSection()));
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "HOME", child: Text("HOME")),
                  const PopupMenuItem(value: "EUREKA", child: Text("EUREKA")),
                  const PopupMenuItem(value: "COLLABORATION", child: Text("COLLABORATION")),
                  const PopupMenuItem(value: "IDEABOX", child: Text("IDEABOX")),
                  const PopupMenuItem(value: "INCUBATION", child: Text("INCUBATION")),
                  const PopupMenuItem(value: "CONTACT US", child: Text("CONTACT US")),
                ],
              ),
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
              // 🔹 Hero
              const VideoHero(
                videoPath:
                    "https://res.cloudinary.com/df2tpx1ld/video/upload/v1757951989/IMG_8344_symvha.mp4",
              ),

              // 🔹 Upcoming Events
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
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
                        await _launchUrl("https://whatsapp.com/channel/0029Vb6yfNNI7BeJhuSzYL1y");
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

              // 🔹 Vision Section
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    return Row(
                      children: [
                        Expanded(child: _visionText()),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Image.asset("assets/vision.jpg", height: 350, fit: BoxFit.contain),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _visionText(),
                        const SizedBox(height: 20),
                        Image.asset("assets/vision.jpg", height: 200, fit: BoxFit.contain),
                      ],
                    );
                  }
                }),
              ),

              // 🔹 About IEDC
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    return Row(
                      children: [
                        Expanded(
                          child: Image.asset("assets/iv.jpg", height: 350, fit: BoxFit.contain),
                        ),
                        const SizedBox(width: 30),
                        Expanded(child: _aboutText()),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Image.asset("assets/iv.jpg", height: 200, fit: BoxFit.contain),
                        const SizedBox(height: 20),
                        _aboutText(),
                      ],
                    );
                  }
                }),
              ),

              // 🔹 Stats Section
              Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "At IEDC BMCE",
                      style: TextStyle(
                        color: const Color.fromRGBO(15, 72, 106, 1.0),
                        fontFamily: "Caveat Brush",
                        fontSize: screenWidth > 600 ? 40 : 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 40,
                      runSpacing: 20,
                      children: [
                        _statsWidget("300+", "Members"),
                        _statsWidget("20+", "Events"),
                        _statsWidget("25+", "Startups"),
                      ],
                    ),
                  ],
                ),
              ),

              // 🔹 Nodal Officer Section
              Container(
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/20250916_111931_0000.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        "NODAL OFFICER'S MESSAGE",
                        style: TextStyle(
                          color: Colors.amber,
                          fontFamily: "Anton",
                          fontSize: screenWidth > 600 ? 40 : 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(builder: (context, constraints) {
                        if (constraints.maxWidth > 900) {
                          return Row(
                            children: [
                              Expanded(child: _officerText()),
                              const SizedBox(width: 40),
                              _officerAvatar(),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              _officerAvatar(),
                              const SizedBox(height: 20),
                              _officerText(),
                            ],
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),

              // 🔹 Footer
              const CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Helper Widgets
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

  Widget _visionText() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OUR VISION",
            style: TextStyle(fontSize: 32, fontFamily: "Anton", fontStyle: FontStyle.italic, color: Colors.amber),
          ),
          SizedBox(height: 16),
          Text(
            "To foster a culture of innovation and entrepreneurship among students...",
            style: TextStyle(fontFamily: "Roboto", fontSize: 16, height: 1.5, color: Colors.white),
          ),
        ],
      );

  Widget _aboutText() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ABOUT IEDC",
            style: TextStyle(fontFamily: "Anton", fontSize: 32, fontStyle: FontStyle.italic, color: Colors.amber),
          ),
          SizedBox(height: 16),
          Text(
            "The Innovation and Entrepreneurship Development Centre (IEDC) of BMCE...",
            style: TextStyle(fontFamily: "Roboto", fontSize: 16, height: 1.5, color: Colors.white),
          ),
        ],
      );

  Widget _statsWidget(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
              color: Color.fromRGBO(15, 72, 106, 1.0), fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0), fontSize: 20),
        ),
      ],
    );
  }

  Widget _officerText() => const Text(
        '"At the Innovation and Entrepreneurship Development Cell (IEDC)..."',
        style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
      );

  Widget _officerAvatar() => Column(
        children: const [
          CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/manojsir.JPG')),
          SizedBox(height: 10),
          Text("Prof. Manoj Kumar",
              style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold)),
          Text("Nodal Officer, IEDC BMCE", style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      );
}
