import 'package:flutter/material.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iedc_web/homepage.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/newsletter_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: isMobile ? 80 : 300, // ✅ FIX
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 12,
              ),
              child: Image.asset(
                'assets/IEDC  LOGO.png',
                height: 40,
              ),
            ),
            if (!isMobile)
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
                  Text("Innovation and Entrepreneurship",
                      style: TextStyle(fontSize: 10)),
                  Text("Development Centre, BMCE",
                      style: TextStyle(fontSize: 10)),
                ],
              ),
          ],
        ),
        actions: [
          if (!isMobile)
            Row(
              children: [
                _navButton(context, "HOME", const HomePage()),
                _navButton(context, "EUREKA", const NewsletterSection()),
                _navButton(context, "COLLABORATION",
                    const CollaborationSection()),
                _navButton(context, "IDEABOX", const IdeaBoxSection()),
                _navButton(context, "INCUBATION", const Incubation()),
                _navButton(context, "CONTACT US", const ContactSection()),
              ],
            )
          else
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu,
                  color: Color.fromRGBO(15, 72, 106, 1.0)),
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
                PopupMenuItem(
                    value: "COLLABORATION",
                    child: Text("COLLABORATION")),
                PopupMenuItem(value: "IDEABOX", child: Text("IDEABOX")),
                PopupMenuItem(value: "INCUBATION", child: Text("INCUBATION")),
                PopupMenuItem(value: "CONTACT US", child: Text("CONTACT US")),
              ],
            ),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 20 : 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    "We’d love to hear from you! Whether you have an idea to share, want to collaborate, or simply wish to learn more about our initiatives, feel free to reach out.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Innovation and Entrepreneurship Development Centre,\n"
                    "Baselios Mathews II College of Engineering (BMCE),\n"
                    "Lake View, Muthupilakkadu, Sasthamcotta,\n"
                    "Kollam, Kerala – 690521, India.",
                    style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Colors.white70),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () =>
                        _launchUrl("mailto:iedciicbmce@gmail.com"),
                    child: const SelectableText(
                      "iedciicbmce@gmail.com",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.amber,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "Stay Connected",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),

                  Wrap( // ✅ FIX: wraps on small screens
                    spacing: 16,
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.whatsapp,
                            color: Colors.green),
                        onPressed: () => _launchUrl(
                            "https://whatsapp.com/channel/0029Vb6yfNNI7BeJhuSzYL1y"),
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin,
                            color: Colors.blue),
                        onPressed: () => _launchUrl(
                            "https://www.linkedin.com/company/iedc-bmce/"),
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.purple),
                        onPressed: () =>
                            _launchUrl("https://www.instagram.com/iedc.bmce"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
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
