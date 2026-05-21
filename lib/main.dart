import 'package:flutter/material.dart';
import 'pages/inicio_page.dart';

void main() {
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