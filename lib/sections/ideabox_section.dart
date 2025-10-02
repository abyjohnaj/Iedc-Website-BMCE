import 'package:flutter/material.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:video_player/video_player.dart';
import 'package:iedc_web/homepage.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/login.dart';
import 'package:iedc_web/sections/newsletter_section.dart';

class IdeaBoxSection extends StatefulWidget {
  const IdeaBoxSection({super.key});

  @override
  State<IdeaBoxSection> createState() => _IdeaBoxSectionState();
}

class _IdeaBoxSectionState extends State<IdeaBoxSection> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/videos/IMG_8262.MP4", // ✅ use your IdeaBox video
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0); // mute
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 300,
        leading: SizedBox(
          width: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/IEDC  LOGO.png'),
              ),
              if (screenWidth > 600) // hide text on small screens
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
                  _navButton(context, "HOME", const HomePage()),
                  _navButton(context, "EUREKA", const NewsletterSection()),
                  _navButton(context, "COLLABORATION", const CollaborationSection()),
                  _navButton(context, "IDEABOX", const IdeaBoxSection()),
                  _navButton(context, "INCUBATION", const Incubation()),
                  _navButton(context, "CONTACT US", const ContactSection()),
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
      body: Stack(
        children: [
          // 🔹 Background video (already responsive)
          SizedBox.expand(
            child: _controller.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  // 🔹 Nav Button Helper
  Widget _navButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(
        label,
        style: const TextStyle(
          color: Color.fromRGBO(15, 72, 106, 1.0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
