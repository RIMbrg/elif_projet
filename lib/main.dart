// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const FirebaseOptions(apiKey: "AIzaSyCEZ_Wy2-4eVUibGo2v8EmAnnkehlNiUYo", appId:"1:810142575890:android:43a2469b27964f3a0a57cb", messagingSenderId: "messagingSenderId", projectId:"projet-testt-b7862"));
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(



      ),

    );
  }
}
