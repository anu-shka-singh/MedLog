import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlog/pick_file.dart';
import 'package:medlog/signin.dart';
import 'dart:async';
import 'firebase_options.dart';
import 'logoPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      title: 'Med Log',
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      // home: PickFile(),
      home: Signin()
    );
  }

  
}
