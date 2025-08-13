import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(60),
      color: const Color(0xFFF2F7FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Innovation and Entrepreneurship Development Cell',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF004AAD)),
          ),
          SizedBox(height: 20),
          Text(
            'Fostering innovation, ideas and leadership among students.',
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
