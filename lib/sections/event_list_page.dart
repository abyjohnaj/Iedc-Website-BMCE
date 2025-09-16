import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminEventListPage extends StatelessWidget {
  const AdminEventListPage({super.key});

  Future<void> _deleteEvent(BuildContext context, String id) async {
    await FirebaseFirestore.instance.collection('events').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Event deleted successfully")),
    );
  }

  void _editEvent(BuildContext context, String id, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEventPage(eventId: id, eventData: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Events")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('events')
            .orderBy('date')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading events"));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final events = snapshot.data!.docs;

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              final data = event.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(data['title'] ?? 'No Title'),
                  subtitle: Text(data['description'] ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editEvent(context, event.id, data),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteEvent(context, event.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class EditEventPage extends StatefulWidget {
  final String eventId;
  final Map<String, dynamic> eventData;

  const EditEventPage(
      {super.key, required this.eventId, required this.eventData});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _imageUrlController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.eventData['title'] ?? '');
    _descController =
        TextEditingController(text: widget.eventData['description'] ?? '');
    _imageUrlController =
        TextEditingController(text: widget.eventData['imageUrl'] ?? '');

    // Parse date from Firestore string
    try {
      _selectedDate = DateTime.tryParse(widget.eventData['date'] ?? '');
    } catch (_) {
      _selectedDate = null;
    }
  }

  /// Convert Google Drive share link to direct view link
  String _convertGoogleDriveLink(String url) {
    final regExp = RegExp(r'd/([a-zA-Z0-9_-]+)');
    final match = regExp.firstMatch(url);
    if (match != null) {
      final fileId = match.group(1);
      return "https://drive.google.com/uc?export=view&id=$fileId";
    }
    return url;
  }

  Future<void> _updateEvent() async {
    String imageUrl = _imageUrlController.text;

    if (imageUrl.isNotEmpty) {
      imageUrl = _convertGoogleDriveLink(imageUrl);
    }

    await FirebaseFirestore.instance
        .collection('events')
        .doc(widget.eventId)
        .update({
      'title': _titleController.text,
      'description': _descController.text,
      'date': _selectedDate?.toIso8601String() ?? '',
      'imageUrl': imageUrl,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Event updated successfully")),
    );

    Navigator.pop(context); // Go back to list after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Event")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            Row(
              children: [
                Text(_selectedDate == null
                    ? 'No date selected'
                    : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() => _selectedDate = picked);
                    }
                  },
                  child: const Text("Pick Date"),
                ),
              ],
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateEvent,
              child: const Text("Update Event"),
            ),
          ],
        ),
      ),
    );
  }
}
