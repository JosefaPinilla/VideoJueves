import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'final_page.dart';

class EncuestaPage extends StatefulWidget {
  const EncuestaPage({super.key});

  @override
  State<EncuestaPage> createState() => _EncuestaPageState();
}

class _EncuestaPageState extends State<EncuestaPage> {

  final TextEditingController pregunta1Controller =
  TextEditingController();

  final TextEditingController pregunta2Controller =
  TextEditingController();

  final TextEditingController pregunta3Controller =
  TextEditingController();

  bool _isLoading = false;

  // informacion a guardar
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;

      return {
        'modeloDispositivo': android.model,
        'sistemaOperativo': 'Android ${android.version.release}',
      };
    }

    return {
      'modeloDispositivo': 'Desconocido',
      'sistemaOperativo': 'Desconocido',
    };
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

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

                      // titulo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text(
                            "Encuesta",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.blue,
                              size: 32,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // pregunta 1
                      const Text(
                        "¿Qué mensaje principal transmite el video?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(controller: pregunta1Controller),

                      const SizedBox(height: 20),

                      // pregunta 2
                      const Text(
                        "¿Cómo puede la Responsabilidad Social generar impacto?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(controller: pregunta2Controller),

                      const SizedBox(height: 20),

                      // pregunta 3
                      const Text(
                        "¿Te gustaría participar en iniciativas sostenibles?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(controller: pregunta3Controller),

                      const Spacer(),

                      // boton
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : () async {

                            final p1 = pregunta1Controller.text.trim();
                            final p2 = pregunta2Controller.text.trim();
                            final p3 = pregunta3Controller.text.trim();

                            if (p1.isEmpty || p2.isEmpty || p3.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Completa todas las preguntas"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            setState(() => _isLoading = true);

                            try {
                              // info
                              final deviceData = await getDeviceInfo();

                              // firestore
                              await FirebaseFirestore.instance
                                  .collection('encuestas')
                                  .add({
                                'pregunta1': p1,
                                'pregunta2': p2,
                                'pregunta3': p3,
                                'fechaHora': DateTime.now().toIso8601String(),
                                'modeloDispositivo': deviceData['modeloDispositivo'],
                                'sistemaOperativo': deviceData['sistemaOperativo'],
                              });

                              if (!mounted) return;

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const FinalPage(),
                                ),
                              );

                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error: $e"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } finally {
                              if (mounted) {
                                setState(() => _isLoading = false);
                              }
                            }
                          },

                          child: const Text(
                            "Enviar",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}