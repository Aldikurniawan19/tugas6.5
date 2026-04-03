import 'package:flutter/material.dart';
import 'screens/get_started/get_started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimalist App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema minimalis: background putih, elemen utama hitam
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const GetStartedScreen(),
    );
  }
}
