import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medlog/signin.dart';
import 'dart:async';
import 'firebase_options.dart';
import 'logoPage.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Med Log',
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
