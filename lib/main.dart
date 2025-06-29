import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/features/pets/presentation/pets_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paws for Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF7A00), // 따뜻한 주황
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF7F0),
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF7F0),
          foregroundColor: Color(0xFFFF7A00),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFFFF7A00),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
          bodyLarge: TextStyle(color: Color(0xFF444444)),
          bodySmall: TextStyle(color: Color(0xFF888888)),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF7A00),
          foregroundColor: Colors.white,
        ),
      ),
      home: const PetsListScreen(),
    );
  }
}
