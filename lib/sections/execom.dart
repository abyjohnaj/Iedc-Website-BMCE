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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        
        child: Column(
          children: [
            Text("Execom Members",
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                OfficerCard(
                  imagePath: "assets/ivin.png",
                  name: "Ivin Saji",
                  description:
                      "Student Lead",
                ),
                OfficerCard(
                  imagePath: "assets/Gouri.JPG",
                  name: "Gouri Krishna",
                  description:
                      "Student Lead",
                ),
                OfficerCard(
                  imagePath: "assets/Vaishnavi.JPG",
                  name: "Vaishnavi S.",
                  description:
                      "Operations Lead",
                ),
              ],
            ),

                          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                OfficerCard(
                  imagePath: "assets/jeswin.png",
                  name: "Jeswin Jacob",
                  description:
                      "Branding & Marketing Lead",
                ),
                OfficerCard(
                  imagePath: "assets/Aby.jpg",
                  name: "Aby John",
                  description:
                      "Branding & Marketing Lead",
                ),
                OfficerCard(
                  imagePath: "assets/Niranjana.JPG",
                  name: "Niranjana Unni",
                  description:
                      "Finance Lead",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                OfficerCard(
                  imagePath: "assets/anupa.jpg",
                  name: "Anupa Alex",
                  description:
                      "Finance Lead",
                ),
                OfficerCard(
                  imagePath: "assets/Aaron.JPG",
                  name: "Aaron Panicker",
                  description:
                      "Creative Lead",
                ),
                OfficerCard(
                  imagePath: "assets/sooraj.JPG",
                  name: "Sooraj Subash",
                  description:
                      "Community Lead",
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                OfficerCard(
                  imagePath: "assets/Advaith.JPG",
                  name: "Advaith N.",
                  description:
                      "Community Lead",
                ),
                OfficerCard(
                  imagePath: "assets/nijin.JPG",
                  name: "Muhammad Nijin",
                  description:
                      "Community Lead",
                ),
                OfficerCard(
                  imagePath: "assets/sruthy.JPG",
                  name: "Sruthy Prasad R.",
                  description:
                      "Community Lead",
                ),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                OfficerCard(
                  imagePath: "assets/Meenakshi.JPG",
                  name: "Meenakshi M. S.",
                  description:
                      "Women Innovation Lead",
                ),
                OfficerCard(
                  imagePath: "assets/Anna.JPG",
                  name: "Anna Rachel Biju",
                  description:
                      "Women Innovation Lead",
                ),
                OfficerCard(
                  imagePath: "assets/amal.JPG",
                  name: "Amal Shaji",
                  description:
                      "Media Lead",
                ),
                
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                    OfficerCard(
                  imagePath: "assets/joshua.JPG",
                  name: "Joshua",
                  description:
                      "Media Lead",
                ),
                OfficerCard(
                  imagePath: "assets/Jiorijin.JPG",
                  name: "Jiorijin Prakash",
                  description:
                      "IPR & Research Lead",
                ),
                OfficerCard(
                      imagePath: "assets/abiel.jpeg",
                      name: "Abiel Saji Varghese",
                      description:
                          "IPR & Research Lead",
                    ),
              ],
            ),
             
          ],
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
