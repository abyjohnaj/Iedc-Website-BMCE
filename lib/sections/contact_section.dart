import 'package:flutter/material.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iedc_web/homepage.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/login.dart';
import 'package:iedc_web/sections/newsletter_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Function to launch URLs
  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
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
              if (screenWidth > 600) // hide text on smaller screens
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
        padding: EdgeInsets.all(screenWidth > 600 ? 40 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact Us",
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16),
              child: SelectableText(
                'We’d love to hear from you! Whether you have an idea to share, want to collaborate, or simply wish to learn more about our initiatives,\n'
                'feel free to reach out. \n\n'
                'Address:\n\n'
                'Innovation and Entrepreneurship Development Centre, \nBaselios Mathews II College of Engineering (BMCE),\n'
                'Lake View, Muthupilakkadu, Sasthamcotta, Kollam, Kerala, \n'
                '690521, India. \n\n'
                'Email: iedciicbmce@gmail.com. \n\n'
                'Stay Connected\n\nFollow us on social media for updates about events, workshops, and opportunities.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, height: 1.5, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // 👇 Social Media Icons (responsive wrap)
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp,
                      color: Colors.green, size: 32),
                  onPressed: () async {
                    await _launchUrl(
                        "https://whatsapp.com/channel/0029Vb6yfNNI7BeJhuSzYL1y");
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin,
                      color: Colors.blue, size: 32),
                  onPressed: () async {
                    await _launchUrl(
                        "https://www.linkedin.com/company/iedc-bmce/");
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.purple, size: 32),
                  onPressed: () async {
                    await _launchUrl(
                        "https://www.instagram.com/iedc.bmce?igsh=MW9jd3k3cjNmYWpnNg==");
                  },
                ),
              ],
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
