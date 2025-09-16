import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iedc_web/sections/execom.dart';
import 'package:iedc_web/sections/web_team.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iedc_web/sections/nodal_officers.dart';


class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: IEDC details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "IEDC BMCE",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Innovation and Entrepreneurship Development Centre, \nBaselios Mathews II College of Engineering\nLake View, Muthupilakkadu, Sasthamcotta - 690520\nEmail id: iedciicbmce@gmail.com",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // Middle: Team section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Team",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NodalOfficersPage()));
                      },
                      child: const Text("Nodal Officers",
                          style: TextStyle(color: Colors.white70)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Execom()));
                      },
                      child: const Text("Execom",
                          style: TextStyle(color: Colors.white70)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WebTeam()));
                      },
                      child: const Text("Web Team",
                          style: TextStyle(color: Colors.white70)),
                    ),
                  ],
                ),
              ),

              // Right side: Social links
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Follow us on",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.whatsapp,
                            color: Colors.green, size: 28),
                        onPressed: () async {
                          await _launchUrl(
                              "https://whatsapp.com/channel/0029Vb6yfNNI7BeJhuSzYL1y");
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin,
                            color: Colors.blue, size: 28),
                        onPressed: () async {
                          await _launchUrl(
                              "https://www.linkedin.com/company/iedc-bmce/");
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.purple, size: 28),
                        onPressed: () async {
                          await _launchUrl(
                              "https://www.instagram.com/iedc.bmce?igsh=MW9jd3k3cjNmYWpnNg==");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Copyright
          const Align(
            alignment: Alignment.center,
            child: Text(
              "© 2025 IEDC BMCE | All Rights Reserved",
              style: TextStyle(color: Colors.white38, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
