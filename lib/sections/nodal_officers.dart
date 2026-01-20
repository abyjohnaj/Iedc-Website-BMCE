import 'package:flutter/material.dart';
import 'package:iedc_web/homepage.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:iedc_web/sections/newsletter_section.dart';

class NodalOfficersPage extends StatelessWidget {
  const NodalOfficersPage({super.key});

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
            Center(
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

      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth > 600 ? 20 : 10),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Nodal Officers",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            _responsiveGrid(const [
              OfficerCard(imagePath: "assets/manojsir.JPG", name: "Prof. ManojKumar", description: "Nodal Officer"),
              OfficerCard(imagePath: "assets/sitharamiss.JPG", name: "Dr. Sithara Gopinath", description: "Nodal Officer"),
              OfficerCard(imagePath: "assets/sreekumarsir.PNG", name: "Prof. Sreekumar Pillai", description: "Nodal Officer"),
            ]),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "IEDC Department Co-ordinators",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            _responsiveGrid(const [
              OfficerCard(imagePath: "assets/rakhimiss.JPG", name: "Mrs. Rakhi Jayakumar", description: "CE"),
              OfficerCard(imagePath: "assets/shymamiss.PNG", name: "Mrs. Shyma S.", description: "EEE"),
              OfficerCard(imagePath: "assets/princymiss.PNG", name: "Mrs. Princy Sera Rajan", description: "ECE"),
              OfficerCard(imagePath: "assets/alfiyamiss.JPG", name: "Mrs. Alfiya S.", description: "AI"),
              OfficerCard(imagePath: "assets/anakhamiss.JPG", name: "Mrs. Anakha A. S.", description: "CSE"),
              OfficerCard(imagePath: "assets/nandanamiss.PNG", name: "Mrs. Nandana Jayakumar", description: "MBA"),
            ]),
          ],
        ),
      ),
    );
  }

  // ✅ RESPONSIVE FIX HERE
  Widget _responsiveGrid(List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount =
            constraints.maxWidth < 800 ? 1 : 3;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7,
          children: children,
        );
      },
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
              height: 320,
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
