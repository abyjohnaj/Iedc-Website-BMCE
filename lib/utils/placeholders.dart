import 'package:flutter/material.dart';

Widget sectionPlaceholder(String title) {
  return Container(
    padding: const EdgeInsets.all(60),
    width: double.infinity,
    color: const Color(0xFFF9F9F9),
    child: Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
    ),
  );
}