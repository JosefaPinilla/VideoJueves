import 'dart:async';

import 'package:flutter/material.dart';

import 'video_page.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {

  @override
  void initState() {
    super.initState();

    iniciarPantalla();
  }

  Future<void> iniciarPantalla() async {

    await Future.delayed(
      const Duration(seconds: 5),
    );

    if (mounted) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const VideoPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              // CONTENIDO PRINCIPAL
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      // LOGO
                      Image.asset(
                        "assets/images/logo_fing.png",
                        height: 90,
                      ),

                      const SizedBox(height: 35),

                      // TITULO
                      const Text(
                        "Encuesta Académica\nUNACH Sostenible",
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // DESCRIPCION
                      const Text(
                        "La Universidad Adventista de Chile está desarrollando una encuesta relacionada con iniciativas de Responsabilidad Social Universitaria y sostenibilidad.\n\n"
                            "La información recopilada será utilizada exclusivamente con fines académicos y de investigación.",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.7,
                        ),
                      ),

                      const SizedBox(height: 35),

                      // INDICADOR
                      const CircularProgressIndicator(),

                      const SizedBox(height: 18),

                      const Text(
                        "Cargando contenido...",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // BOTTOM NAVIGATION
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,

                  children: [

                    Icon(
                      Icons.home,
                      color: Colors.blue,
                      size: 30,
                    ),

                    Icon(
                      Icons.play_circle_fill,
                      color: Colors.grey,
                      size: 30,
                    ),

                    Icon(
                      Icons.assignment,
                      color: Colors.grey,
                      size: 30,
                    ),

                    Icon(
                      Icons.groups,
                      color: Colors.grey,
                      size: 30,
                    ),

                    Icon(
                      Icons.workspace_premium,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}