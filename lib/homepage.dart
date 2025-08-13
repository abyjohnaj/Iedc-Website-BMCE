import 'package:flutter/material.dart';
import 'package:iedc_web/upcoming_events_row.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/newsletter_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFFFFFF),
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
                onPressed: () {},
                child: const Text(
                  'TEAM',
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
body: NotificationListener<ScrollNotification>(
  onNotification: (scrollNotification) {
    if (scrollNotification.metrics.axis == Axis.vertical) {
      double offset = scrollNotification.metrics.pixels;
      setState(() {
        _opacity = (offset / 200).clamp(0, 1); // fade-in after 200px
      });
    }
    return false;
  },
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero section
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/IEDC COVER.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Black section with heading
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: const [
              Text(
                "WHAT'S NEXT",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 30),
              UpcomingEventsRow(), // Firestore events
            ],
          ),
        ),
      ],
    ),
  ),
)













      
    );
  }
}

