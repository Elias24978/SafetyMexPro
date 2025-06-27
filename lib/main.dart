// 1. Importar los paquetes que necesitamos
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Próximamente importaremos el paquete de Maps_flutter aquí

Future<void> main() async {
  // 2. Cargar nuestro archivo .env antes de que la app inicie
  await dotenv.load(fileName: ".env");

  // Inicia la aplicación
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafetyMex App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // La pantalla inicial de nuestra app será SafetyMapScreen
      home: const SafetyMapScreen(),
    );
  }
}

class SafetyMapScreen extends StatefulWidget {
  const SafetyMapScreen({super.key});

  @override
  State<SafetyMapScreen> createState() => _SafetyMapScreenState();
}

class _SafetyMapScreenState extends State<SafetyMapScreen> {

  // 3. Leer la API Key de forma segura desde el archivo .env
  // ¡Tu clave ya no está escrita directamente en el código!
  final String googleApiKey = dotenv.env['GOOGLE_API_KEY']!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Seguridad'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Usaremos el widget de GoogleMap en el cuerpo de la pantalla
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          // Coordenadas iniciales (Zócalo de la Ciudad de México)
          target: LatLng(19.432608, -99.133209),
          zoom: 14,
        ),
      ),
    );
  }
}