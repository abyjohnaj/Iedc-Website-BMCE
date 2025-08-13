import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFF004AAD),
      child: const Center(
        child: Text(
          '© 2025 IEDC BMCE. All rights reserved.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
