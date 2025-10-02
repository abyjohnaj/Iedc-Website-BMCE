import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iedc_web/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCouHnDlRq6UHVcfu67JqsHTXePohr1dDY",
      authDomain: "iedcwebsite-6a1fc.firebaseapp.com",
      projectId: "iedcwebsite-6a1fc",
      storageBucket: "iedcwebsite-6a1fc.firebasestorage.app",
      messagingSenderId: "487120249063",
      appId: "1:487120249063:web:6e54e6972560d11a9c8242",
      measurementId: "G-PKXXSF07H2"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IEDC Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
