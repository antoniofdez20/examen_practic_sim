import 'package:examen_practic_sim/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'preferences/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //este widget nos asegura que se han establecido unos canales primitivos a bajo nivel para ejecutar el metodo asincrono para inicializar
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz Land',
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      theme: ThemeData.dark(),
    );
  }
}
