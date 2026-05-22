import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'encuesta_page.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  VideoPlayerController? _controller;

  bool videoListo = false;
  bool mostrarBotonEncuesta = false;

  @override
  void initState() {
    super.initState();

    iniciarVideo();
  }

  Future<void> iniciarVideo() async {

    _controller = VideoPlayerController.asset(
      'assets/videos/video_vcm.mp4',
    );

    await _controller!.initialize();

    await _controller!.play();

    _controller!.addListener(() {

      if (_controller == null) return;

      final valor = _controller!.value;

      if (!valor.isInitialized) return;

      final duracion =
          valor.duration.inMilliseconds;

      final posicion =
          valor.position.inMilliseconds;

      if (duracion > 0 &&
          posicion >= duracion - 500) {

        if (!mostrarBotonEncuesta) {

          setState(() {
            mostrarBotonEncuesta = true;
          });
        }
      }
    });

    if (mounted) {

      setState(() {
        videoListo = true;
      });
    }
  }

  @override
  void dispose() {

    _controller?.dispose();

    super.dispose();
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
                    children: [

                      // titulo
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          const Text(
                            "UNACH Sostenible",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },

                            icon: const Icon(
                              Icons.close,
                              color: Colors.blue,
                              size: 32,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // video
                      Expanded(
                        child: Container(
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                            BorderRadius.circular(20),
                          ),

                          child: videoListo
                              ? Center(
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(20),

                              child: AspectRatio(
                                aspectRatio:
                                _controller!
                                    .value.aspectRatio,

                                child: VideoPlayer(
                                  _controller!,
                                ),
                              ),
                            ),
                          )
                              : const Center(
                            child:
                            CircularProgressIndicator(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // descripcion breve
                      const Text(
                        "La Responsabilidad Social Universitaria busca generar un impacto positivo y sostenible en la comunidad.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // play / pausa
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),

                            child: IconButton(

                              onPressed: videoListo
                                  ? () {

                                setState(() {

                                  if (_controller!
                                      .value.isPlaying) {

                                    _controller!.pause();

                                  } else {

                                    _controller!.play();
                                  }
                                });

                              }
                                  : null,

                              icon: Icon(

                                (_controller != null &&
                                    _controller!
                                        .value.isPlaying)
                                    ? Icons.pause
                                    : Icons.play_arrow,

                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // boton a encuesta
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            mostrarBotonEncuesta
                                ? Colors.blue
                                : Colors.grey,
                          ),

                          onPressed:
                          mostrarBotonEncuesta
                              ? () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const EncuestaPage(),
                              ),
                            );

                          }
                              : null,

                          child: const Text(
                            "Ir a encuesta",
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

              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(20),
                ),

                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,

                  children: [

                    Icon(Icons.home,
                        color: Colors.grey.shade400),

                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.blue,
                    ),

                    Icon(Icons.assignment,
                        color: Colors.grey.shade400),

                    Icon(Icons.groups,
                        color: Colors.grey.shade400),

                    Icon(Icons.workspace_premium,
                        color: Colors.grey.shade400),
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