import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_03/utils/button_style.dart';
import 'package:test_03/utils/color.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 200,
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              'Bienvenido a TaskList\nVamos a empezar',
              style: const TextStyle(color: ColorApp.color_04, fontSize: 35, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 140),
          Row(
            children: [
              Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20)),
              Text(
                'RECOMENDADO',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins( color: ColorApp.color_03, fontWeight: FontWeight.w900, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ButtonStyleContainers(text: 'Ejercicios'),
                      ButtonStyleContainers(text: 'Leer libros'),
                      ButtonStyleContainers(text: 'Meditaacion'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ButtonStyleContainers(text: 'Planificaciones'),
                      ButtonStyleContainers(text: 'Organizado'),
                      ButtonStyleContainers(text: 'Reuniones'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ButtonStyleContainers(text: 'Resumen'),
                      ButtonStyleContainers(text: 'Estirarse por 15 minutos'),
                      ButtonStyleContainers(text: 'Eventos'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.color_06,
              padding: EdgeInsets.symmetric(horizontal: 145, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            child: const Text('Continuar', style: TextStyle(color: ColorApp.color_02, fontSize: 20)),
          ),
        ],
      ),
    );
  }
}