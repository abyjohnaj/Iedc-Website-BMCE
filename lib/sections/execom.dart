import 'package:flutter/material.dart';
import 'package:iedc_web/homepage.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:iedc_web/sections/newsletter_section.dart';

class Execom extends StatelessWidget {
  const Execom({super.key});

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
              if (screenWidth > 600) // hide long text on small screens
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
            ? Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _navButton(context, "HOME", const HomePage()),
                    _navButton(context, "EUREKA", const NewsletterSection()),
                    _navButton(context, "COLLABORATION", const CollaborationSection()),
                    _navButton(context, "IDEABOX", const IdeaBoxSection()),
                    _navButton(context, "INCUBATION", const Incubation()),
                    _navButton(context, "CONTACT US", const ContactSection()),
                  ],
                ),
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
        padding: EdgeInsets.all(screenWidth > 600 ? 20 : 10),
        child: Column(
          children: [
            const Text(
              "Execom Members",
              style: TextStyle(color: Colors.amber, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 🔹 Responsive grid of officer cards
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 3; // default desktop
                if (constraints.maxWidth < 1200) crossAxisCount = 2; // tablet
                if (constraints.maxWidth < 700) crossAxisCount = 1; // mobile

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                  children: const [
                    OfficerCard(imagePath: "assets/ivin.png", name: "Ivin Saji", description: "Student Lead"),
                    OfficerCard(imagePath: "assets/Gouri.JPG", name: "Gouri Krishna", description: "Student Lead"),
                    OfficerCard(imagePath: "assets/Vaishnavi.JPG", name: "Vaishnavi S.", description: "Operations Lead"),
                    OfficerCard(imagePath: "assets/jeswin.png", name: "Jeswin Jacob", description: "Branding & Marketing Lead"),
                    OfficerCard(imagePath: "assets/Aby.jpg", name: "Aby John", description: "Branding & Marketing Lead"),
                    OfficerCard(imagePath: "assets/Niranjana.JPG", name: "Niranjana Unni", description: "Finance Lead"),
                    OfficerCard(imagePath: "assets/anupa.jpg", name: "Anupa Alex", description: "Finance Lead"),
                    OfficerCard(imagePath: "assets/Aaron.JPG", name: "Aaron Panicker", description: "Creative Lead"),
                    OfficerCard(imagePath: "assets/sooraj.JPG", name: "Sooraj Subash", description: "Community Lead"),
                    OfficerCard(imagePath: "assets/Advaith.JPG", name: "Advaith N.", description: "Community Lead"),
                    OfficerCard(imagePath: "assets/nijin.JPG", name: "Muhammad Nijin", description: "Community Lead"),
                    OfficerCard(imagePath: "assets/sruthy.JPG", name: "Sruthy Prasad R.", description: "Community Lead"),
                    OfficerCard(imagePath: "assets/Meenakshi1.JPG", name: "Meenakshi M. S.", description: "Women Innovation Lead"),
                    OfficerCard(imagePath: "assets/Anna.JPG", name: "Anna Rachel Biju", description: "Women Innovation Lead"),
                    OfficerCard(imagePath: "assets/amal.JPG", name: "Amal Shaji", description: "Media Lead"),
                    OfficerCard(imagePath: "assets/joshua.JPG", name: "Joshua", description: "Media Lead"),
                    OfficerCard(imagePath: "assets/Jiorijin.JPG", name: "Jiorijin Prakash", description: "IPR & Research Lead"),
                    OfficerCard(imagePath: "assets/abiel.jpeg", name: "Abiel Saji Varghese", description: "IPR & Research Lead"),
                  ],
                );
              },
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

class OfficerCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;

  const OfficerCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
