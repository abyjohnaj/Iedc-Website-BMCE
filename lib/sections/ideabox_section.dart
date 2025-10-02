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
                child: Image.asset('assets/IEDC  LOGO.png', ),
                
              ),
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
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'HOME',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewsletterSection()),
                  );
                },
                child: const Text(
                  'EUREKA',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CollaborationSection()),
                  );
                },
                child: const Text(
                  'COLLABORATION',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IdeaBoxSection()),
                  );
                },
                child: const Text(
                  'IDEABOX',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Incubation()));
                },
                child: const Text(
                  'INCUBATION',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactSection()),
                  );
                },
                child: const Text(
                  'CONTACT US',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background video
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
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          // Overlay text (optional, you can add IdeaBox-specific heading here)
        ],
      ),
    );
  }
}
