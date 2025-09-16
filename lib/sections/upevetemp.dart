import 'package:flutter/material.dart';

class Upevetemp extends StatelessWidget {
  const Upevetemp({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary hardcoded event list (from assets)
    final List<Map<String, String>> tempEvents = [
      {
        "title": "EKAH'25",
        "description": "A Techno Cultural Fest hosted by IEDC BMCE",
        "date": "Oct 17, 2025",
        "assetImage":
            "assets/eventposters/EKAH_2025poster.png",
      },
     
       {
        "title": "Ignite",
        "description": "Mobilisation team training",
        "date": "Aug 11, 2025",
        "assetImage": "assets/eventposters/WhatsApp Image 2025-09-12 at 9.25.53 PM.jpeg",
      },
      {
        "title": "Orientation Program",
        "description": "Unlock your full potential. Welcome to Freshers Orientation",
        "date": "Aug 1, 2025",
        "assetImage":
            "assets/eventposters/WhatsApp Image 2025-09-12 at 9.25.52 PM.jpeg",
      },
       {
        "title": "Entrepreneurship Training Workshop",
        "description": "Training on Entrepreneurship Essentials",
        "date": "July 29, 2025",
        "assetImage": "assets/eventposters/WhatsApp Image 2025-09-12 at 9.25.53 PM (1).jpeg",
      },
      
     
    ];

    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tempEvents.length,
        itemBuilder: (context, index) {
          var event = tempEvents[index];

          return Container(
            height: 250,
            width: 250,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Event Image (from assets)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: event["assetImage"] != null
                      ? Image.asset(
                          event["assetImage"]!,
                          height: 250,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(Icons.image, size: 40),
                        ),
                ),
                // Event Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          event['title'] ?? 'Untitled',
                          style: const TextStyle(
                            fontFamily: "League Spartan",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Description (only if not empty)
                        if (event['description'] != null &&
                            event['description']!.isNotEmpty)
                          Text(
                            event['description']!,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        const SizedBox(height: 5),

                        // Date
                        Text(
                          event['date'] ?? 'No date',
                          style: const TextStyle(
                            fontFamily: "League Spartan",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
