import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/inicio_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const VideoJuevesApp());
}

class VideoJuevesApp extends StatelessWidget {
  const VideoJuevesApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Jueves',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const InicioPage(),
    );
  }
}