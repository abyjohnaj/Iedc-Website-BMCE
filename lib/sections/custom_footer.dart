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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 800;

          return Column(
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _aboutSection(),
                        const SizedBox(height: 24),
                        _teamSection(context, isMobile: true),
                        const SizedBox(height: 24),
                        _socialSection(isMobile: true),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _aboutSection()),
                        Expanded(child: _teamSection(context)),
                        _socialSection(),
                      ],
                    ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.center,
                child: Text(
                  "© 2025 IEDC BMCE | All Rights Reserved",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ---------------- SECTIONS ----------------

  Widget _aboutSection() {
    return SizedBox(
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            "Innovation and Entrepreneurship Development Centre,\n"
            "Baselios Mathews II College of Engineering\n"
            "Lake View, Muthupilakkadu, Sasthamcotta - 690520\n"
            "Email id: iedciicbmce@gmail.com",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _teamSection(BuildContext context, {bool isMobile = false}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NodalOfficersPage()),
            );
          },
          child:
              const Text("Nodal Officers", style: TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Execom()),
            );
          },
          child: const Text("Execom", style: TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WebTeam()),
            );
          },
          child: const Text("Web Team", style: TextStyle(color: Colors.white70)),
        ),
      ],
    );
  }

  Widget _socialSection({bool isMobile = false}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        const Text(
          "Follow us on",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.start : MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.whatsapp,
                  color: Colors.green, size: 28),
              onPressed: () async {
                await _launchUrl(
                  "https://whatsapp.com/channel/0029Vb6yfNNI7BeJhuSzYL1y",
                );
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin,
                  color: Colors.blue, size: 28),
              onPressed: () async {
                await _launchUrl(
                  "https://www.linkedin.com/company/iedc-bmce/",
                );
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.instagram,
                  color: Colors.purple, size: 28),
              onPressed: () async {
                await _launchUrl(
                  "https://www.instagram.com/iedc.bmce?igsh=MW9jd3k3cjNmYWpnNg==",
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
