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
              if (screenWidth > 600) // hide long title text on small screens
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
              // 🔹 Hero Section
              const VideoHero(
                videoPath:
                    "https://res.cloudinary.com/df2tpx1ld/video/upload/v1757951989/IMG_8344_symvha.mp4",
              ),

              // 🔹 Upcoming Events
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
                        Expanded(child: _visionTextFull()),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Image.asset("assets/vision.jpg", height: 350, fit: BoxFit.contain),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _visionTextFull(),
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
                        Expanded(child: _aboutTextFull()),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Image.asset("assets/iv.jpg", height: 200, fit: BoxFit.contain),
                        const SizedBox(height: 20),
                        _aboutTextFull(),
                      ],
                    );
                  }
                }),
              ),

              // 🔹 Stats Section (modified to spread across screen)
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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 900) {
                          // 🔹 Desktop → spread to edges
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _statsWidget("300+", "Members"),
                              _statsWidget("20+", "Events"),
                              _statsWidget("25+", "Startups"),
                            ],
                          );
                        } else {
                          // 🔹 Mobile/Tablet → stack
                          return Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 40,
                            runSpacing: 20,
                            children: [
                              _statsWidget("300+", "Members"),
                              _statsWidget("20+", "Events"),
                              _statsWidget("25+", "Startups"),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),

              // 🔹 Nodal Officer Section
              Container(
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
                              Expanded(child: _officerTextFull()),
                              const SizedBox(width: 40),
                              _officerAvatar(),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              _officerAvatar(),
                              const SizedBox(height: 20),
                              _officerTextFull(),
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

  // 🔹 Nav button helper
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

  // 🔹 Full Vision text
  Widget _visionTextFull() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OUR VISION",
            style: TextStyle(fontSize: 32, fontFamily: "Anton", fontStyle: FontStyle.italic, color: Colors.amber),
          ),
          SizedBox(height: 16),
          Text(
            "To foster a culture of innovation and entrepreneurship among students, empowering them to become changemakers who create sustainable and impactful solutions for society. By providing the right guidance, mentorship, and resources, IEDC nurtures creative confidence and transforms ideas into reality. It encourages risk-taking, problem-solving, and collaboration, equipping students with the skills needed to thrive in a rapidly evolving world. The centre also bridges the gap between academia and industry, ensuring that innovations address real-world challenges. Ultimately, the vision is to inspire students to think beyond boundaries, lead with purpose, and contribute meaningfully to the nation’s growth. In this journey, IEDC organizes hands-on workshops, hackathons, and networking sessions that connect aspiring innovators with professionals and investors. By fostering a supportive ecosystem, it ensures that every student feels empowered to pursue their entrepreneurial dreams with confidence.",
            style: TextStyle(fontFamily: "Roboto", fontSize: 16, height: 1.5, color: Colors.white),
          ),
        ],
      );

  // 🔹 Full About text
  Widget _aboutTextFull() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ABOUT IEDC",
            style: TextStyle(fontFamily: "Anton", fontSize: 32, fontStyle: FontStyle.italic, color: Colors.amber),
          ),
          SizedBox(height: 16),
          Text(
            "The Innovation and Entrepreneurship Development Centre (IEDC) of BMCE serves as a dynamic platform for students to transform their creative ideas into impactful prototypes and successful startups. Through workshops, hackathons, mentoring sessions, and other initiatives, IEDC nurtures innovation, fosters entrepreneurial thinking, and empowers students to become future-ready innovators and leaders. \n\nIt encourages students from all disciplines to explore real-world problems, experiment with solutions, and gain hands-on experience in building sustainable ventures. By connecting young minds with industry experts, investors, and alumni entrepreneurs, IEDC creates a supportive ecosystem where ideas can grow into scalable businesses. Ultimately, it aims to build a culture of creativity, leadership, and self-reliance among students.",
            style: TextStyle(fontFamily: "Roboto", fontSize: 16, height: 1.5, color: Colors.white),
          ),
        ],
      );

  // 🔹 Stats Widget
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

  // 🔹 Full Officer message
  Widget _officerTextFull() => const Text(
        '"At the Innovation and Entrepreneurship Development Cell (IEDC) of Baselios Mathews II College of Engineering, we strive to ignite young minds with creativity, innovation, and entrepreneurial drive. Our vision is to equip students with the skills, confidence, and opportunities to transform ideas into meaningful solutions that impact society. I encourage every student to actively engage with IEDC initiatives and be part of this journey of innovation and growth."',
        style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
      );

  // 🔹 Officer avatar
  Widget _officerAvatar() => Column(
        children: const [
          CircleAvatar(radius: 100, backgroundImage: AssetImage('assets/manojsir.JPG')),
          SizedBox(height: 10),
          Text("Prof. Manoj Kumar",
              style: TextStyle(fontSize: 22, color: Colors.amber, fontWeight: FontWeight.bold)),
          Text("Nodal Officer, IEDC BMCE", style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      );
}
