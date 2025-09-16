import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AdminAddEventPage extends StatefulWidget {
  const AdminAddEventPage({super.key});

  @override
  State<AdminAddEventPage> createState() => _AdminAddEventPageState();
}

class _AdminAddEventPageState extends State<AdminAddEventPage> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _imageUrlController = TextEditingController();
  DateTime? _selectedDate;

  File? _selectedImage;

  /// Pick image from gallery (optional – but won’t upload to Firebase Storage now)
  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _selectedImage = File(picked.path));
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
    return url; // return original if not a Drive link
  }

  Future<void> _addEvent() async {
    if (_titleController.text.isEmpty ||
        _descController.text.isEmpty ||
        (_selectedImage == null && _imageUrlController.text.isEmpty) ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    String imageUrl = _imageUrlController.text;

    // ✅ Convert Google Drive link if present
    if (imageUrl.isNotEmpty) {
      imageUrl = _convertGoogleDriveLink(imageUrl);
    }

    await FirebaseFirestore.instance.collection('events').add({
      'title': _titleController.text,
      'description': _descController.text,
      'imageUrl': imageUrl,
      'date': _selectedDate!.toIso8601String(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Event added successfully!')),
    );

    _titleController.clear();
    _descController.clear();
    _imageUrlController.clear();
    setState(() {
      _selectedDate = null;
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin - Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Event Title'),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Google Drive Image URL',
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (_selectedImage != null)
                  Image.file(
                    _selectedImage!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  )
                else if (_imageUrlController.text.isNotEmpty)
                  Image.network(
                    _convertGoogleDriveLink(_imageUrlController.text),
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 40),
                  ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text("Pick Image (local preview only)"),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() => _selectedDate = picked);
                    }
                  },
                  child: const Text('Pick Date'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addEvent,
              child: const Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
