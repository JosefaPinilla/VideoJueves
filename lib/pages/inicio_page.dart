import 'package:flutter/material.dart';
import 'video_page.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              // TARJETA PRINCIPAL
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // LOGO FACULTAD
                      Center(
                        child: Image.asset(
                          "assets/images/logo_fing.png",
                          height: 80,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // TITULO
                      const Text(
                        "Autorización para Uso de Datos – Encuesta Académica",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // TEXTO
                      const Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            "La carrera de Ingeniería Comercial de la Universidad Adventista de Chile está realizando una encuesta con fines académicos.\n\n"
                                "Solicitamos su consentimiento para recopilar algunos datos personales y de opinión, basándonos en un servicio de una serie de videos.\n\n"
                                "La información será confidencial y utilizada únicamente para fines investigativos.\n\n"
                                "Al continuar, usted acepta participar voluntariamente.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // BOTON COMENZAR
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),

                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VideoPage(),
                              ),
                            );

                          },

                          child: const Text(
                            "Comenzar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // BOTTOM NAVIGATION
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Icon(Icons.home, color: Colors.blue),
                    Icon(Icons.play_circle_fill, color: Colors.grey.shade400),
                    Icon(Icons.assignment, color: Colors.grey.shade400),
                    Icon(Icons.groups, color: Colors.grey.shade400),
                    Icon(Icons.workspace_premium, color: Colors.grey.shade400),
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