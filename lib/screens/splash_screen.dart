import 'dart:async'; // Necesario para usar el temporizador (Timer)
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // La función initState se ejecuta una sola vez cuando la pantalla se carga
  @override
  void initState() {
    super.initState();

    // Creamos un temporizador que esperará 3 segundos
    Timer(const Duration(seconds: 3), () {
      // Esta es la acción que se ejecutará cuando pasen los 3 segundos.
      print('Splash screen terminada. Lista para navegar.');

      // En el siguiente paso, cambiaremos esto para que nos lleve a la WelcomeScreen.
      // Por ahora, no hará nada más que imprimir en la consola.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold es el lienzo básico para una pantalla
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco, puedes cambiarlo
      body: Center(
        child: Image.asset(
          // Esta es la ruta a tu logo.
          // Asegúrate de que tu imagen se llame 'logo.png'
          'assets/images/logo.png',
          height: 150, // Ajusta el tamaño como prefieras
        ),
      ),
    );
  }
}