import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:iedc_web/homepage.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:iedc_web/sections/login.dart';

// Track if the flipbook is registered
bool _isFlipbookRegistered = false;

// 🔹 Future-proof: Keep all newsletters in one place
final Map<String, String> newsletters = {
  "Eureka - Jan 2025":
      "https://drive.google.com/file/d/13no5SZQYDedneQpACfbn5kVUEQdsvB2C/view?usp=sharing",
};

class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewID = 'newsletter-flipbook';
    final screenWidth = MediaQuery.of(context).size.width;

    if (!_isFlipbookRegistered) {
      ui.platformViewRegistry.registerViewFactory(viewID, (int viewId) {
        final iframe = html.IFrameElement()
          ..src = 'https://online.fliphtml5.com/vaxbbp/iipw/' // Latest issue flipbook link
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%';
        return iframe;
      });
      _isFlipbookRegistered = true;
    }

    // 🔹 Select the latest newsletter (first entry in map)
    final latestIssue = newsletters.entries.first;

    return Scaffold(
      extendBodyBehindAppBar: false,
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
          ),
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

      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "Eureka – The Official IEDC BMCE Newsletter",
            style: TextStyle(
                color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Where Ideas Find Their Voice",
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Eureka is the recurring publication of IEDC BMCE, designed to keep our community inspired and connected. Each edition captures the spirit of innovation happening on campus \nand beyond.",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 10),

          // 🔹 Responsive Flipbook
          Expanded(
            child: Center(
              child: Container(
                width: screenWidth > 1000
                    ? 900
                    : screenWidth > 600
                        ? screenWidth * 0.9
                        : screenWidth * 0.95,
                height: screenWidth > 600 ? 600 : 400,
                child: const HtmlElementView(viewType: viewID),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Download button
          ElevatedButton.icon(
            onPressed: () {
              html.window.open(latestIssue.value, "_blank");
            },
            icon: const Icon(Icons.download, color: Colors.white),
            label: Text("Download ${latestIssue.key}"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

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
