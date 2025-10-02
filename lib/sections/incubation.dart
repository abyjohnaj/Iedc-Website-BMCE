import 'package:flutter/material.dart';
import 'package:iedc_web/homepage.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/newsletter_section.dart';

class Incubation extends StatelessWidget {
  const Incubation({super.key});

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
              if (screenWidth > 600) // hide on very small screens
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth > 600 ? 40 : 20), // reduce padding on small screens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Campus Industrial Park",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "IEDC BMCE nurtures innovation and entrepreneurship by providing incubation support for "
              "student-led startups and aspiring entrepreneurs. Our incubation facilities create a vibrant "
              "ecosystem where ideas are transformed into impactful solutions with the support of mentorship, "
              "resources, and collaboration.\n\n"
              "A key highlight is the upcoming Campus Industrial Park, envisioned as a dynamic space to house "
              "startups, incubation centers, and co-working facilities. This landmark initiative will serve as "
              "a hub for innovation, fostering the growth of campus-born ventures and offering a launchpad for "
              "entrepreneurs to thrive.\n\n"
              "Through these efforts, IEDC BMCE empowers students to explore their entrepreneurial potential, "
              "develop sustainable startups, and contribute to building a culture of innovation within and "
              "beyond the campus.",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable nav button
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
