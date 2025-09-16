import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpcomingEventsRow extends StatelessWidget {
  const UpcomingEventsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('events')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No events planned at the moment — Stay tuned!",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          var docs = snapshot.data!.docs;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var event = docs[index].data() as Map<String, dynamic>;

              // Default placeholder if no image found
              String imageUrl = event['imageUrl'] ?? '';
              if (imageUrl.contains("drive.google.com")) {
                // Convert Google Drive link to direct view link
                final fileId = RegExp(r"/d/([a-zA-Z0-9_-]+)")
                    .firstMatch(imageUrl)
                    ?.group(1);
                if (fileId != null) {
                  imageUrl = "https://drive.google.com/uc?export=view&id=$fileId";
                }
              }

              return Container(
                width: 200,
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
                    // Event Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: imageUrl.isNotEmpty
                          ? Image.network(
                              imageUrl,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  color: Colors.grey,
                                  child: const Icon(Icons.broken_image, size: 40),
                                );
                              },
                            )
                          : Container(
                              height: 120,
                              decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black, Colors.white],begin: Alignment.topLeft,end: Alignment.bottomRight)),
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
                            Text(
                              event['title'] ?? 'Untitled',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              event['date'] ?? 'No date',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
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
          );
        },
      ),
    );
  }
}
