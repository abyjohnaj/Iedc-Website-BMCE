import 'package:flutter/material.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/event_list_page.dart';
import 'package:iedc_web/sections/new_event.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Admin Panel"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CollaborationSection(),
                ),
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: 
      Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminAddEventPage(),
                ),
              );
            },
            child: SizedBox(
              width: 200, // adjust as needed
              height: 60, // adjust as needed
              child: Container(
                decoration: const BoxDecoration(color: Colors.green),
                child: const Center(
                  child: Text(
                    "Add New Event",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminEventListPage(),
            ),
          );
        },
        child: SizedBox(
          width: 200, // adjust as needed
          height: 60, // adjust as needed
          child: Container(
            decoration: const BoxDecoration(color: Colors.red),
            child: const Center(
              child: Text(
                "Edit/Delete Event",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
        ],
      ),
      

    );
  }
}

