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

                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Image.asset(
                          "assets/images/logo_fing.png",
                          height: 90,
                        ),

                        const SizedBox(height: 35),

                        const Text(
                          "Autorizacion para Uso de Datos – Encuesta Academica",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          "La carrera de Ingenieria Comercial de la Universidad Adventista de Chile esta realizando una encuesta con fines academicos. "
                              "Solicitamos su consentimiento para recopilar algunos datos personales y de opinion, basandose en una serie de videos.\n\n"
                              "Le aseguramos que toda la informacion sera confidencial, usada solo para este estudio y manejada segun la normativa de proteccion de datos.\n\n"
                              "Al continuar, usted acepta participar voluntariamente y autoriza el uso de sus respuestas para fines investigativos.\n\n"
                              "Gracias por su colaboracion.\n"
                              "Carrera de Ingenieria Comercial – UNACH",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.7,
                          ),
                        ),

                        const SizedBox(height: 35),

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
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 14),

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Icon(Icons.home, color: Colors.blue, size: 30),
                    Icon(Icons.play_circle_fill, color: Colors.grey, size: 30),
                    Icon(Icons.assignment, color: Colors.grey, size: 30),
                    Icon(Icons.groups, color: Colors.grey, size: 30),
                    Icon(Icons.workspace_premium, color: Colors.grey, size: 30),
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