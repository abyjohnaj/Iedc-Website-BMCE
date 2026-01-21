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
              if (screenWidth > 600)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IEDC",
                      style: TextStyle(
                        color: Color.fromRGBO(15, 72, 106, 1.0),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Innovation and Entreprenuership",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "Development Centre, BMCE",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
            ],
          ),
        ),
        actions: [
          if (screenWidth > 800)
            Row(
              children: [
                _navButton(context, "HOME", const HomePage()),
                _navButton(context, "EUREKA", const NewsletterSection()),
                _navButton(context, "COLLABORATION", const CollaborationSection()),
                _navButton(context, "IDEABOX", const IdeaBoxSection()),
                _navButton(context, "INCUBATION", const Incubation()),
                _navButton(context, "CONTACT US", const ContactSection()),
              ],
            )
          else
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(15, 72, 106, 1.0),
              ),
              onSelected: (value) {
                final pages = {
                  "HOME": const HomePage(),
                  "EUREKA": const NewsletterSection(),
                  "COLLABORATION": const CollaborationSection(),
                  "IDEABOX": const IdeaBoxSection(),
                  "INCUBATION": const Incubation(),
                  "CONTACT US": const ContactSection(),
                };
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => pages[value]!),
                );
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

      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth > 600 ? 20 : 10),
        child: Column(
          children: [
            Text(
              "Execom Members",
              style: TextStyle(
                color: Colors.amber,
                fontSize: screenWidth > 800 ? 32 : 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            LayoutBuilder(
              builder: (context, constraints) {
                final int crossAxisCount =
                    constraints.maxWidth < 800 ? 1 : 3;

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                  children: const [
                    OfficerCard(imagePath: "assets/ivin.png", name: "Ivin Saji", description: "Student Lead"),
                    OfficerCard(imagePath: "assets/Gouri.JPG", name: "Gouri Krishna", description: "Student Lead"),
                    OfficerCard(imagePath: "assets/Vaishnavi.JPG", name: "Vaishnavi S.", description: "Operations Lead"),
                    OfficerCard(imagePath: "assets/jeswin.png", name: "Jeswin Jacob", description: "Branding & Marketing Lead"),
                    OfficerCard(imagePath: "assets/Aby.jpg", name: "Aby John", description: "Branding & Marketing Lead"),
                    OfficerCard(imagePath: "assets/Niranjana.JPG", name: "Niranjana Unni", description: "Finance Lead"),
                    OfficerCard(imagePath: "assets/anupa.jpg", name: "Anupa Alex", description: "Finance Lead"),
                    OfficerCard(imagePath: "assets/Aaron.JPG", name: "Aaron Panicker", description: "Creative Lead"),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
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
      padding: const EdgeInsets.all(16),
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
              height: 335,
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
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
