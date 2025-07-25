import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:paws_for_home/features/splash/splash_screen.dart';
import 'package:paws_for_home/features/pets/presentation/screens/search_filter/search_filter_screen.dart';
import 'package:paws_for_home/features/pets/domain/entities/pet_search_filter.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';

import 'features/pets/presentation/screens/pet_detail/pet_detail_screen.dart';
import 'features/pets/presentation/screens/pets_list/pets_list_screen.dart';
import 'features/pets/presentation/screens/pets_list/favorite_pets_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/pets/presentation/screens/nsa_adopt/nsa_adopt_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '구조동물조회',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3182F6),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF3182F6),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF222222),
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
          backgroundColor: Color(0xFF3182F6),
          foregroundColor: Colors.white,
        ),
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/pets',
      builder: (context, state) => const PetsListScreen(),
      routes: [
        GoRoute(
          path: 'filter',
          builder: (context, state) {
            return const SearchFilterScreen();
          },
        ),
        GoRoute(
          path: 'detail',
          pageBuilder: (context, state) {
            final AbandonmentItem? item = state.extra as AbandonmentItem?;
            if (item == null) {
              return MaterialPage(
                child: const Scaffold(body: Center(child: Text('잘못된 접근입니다.'))),
              );
            }
            return MaterialPage(child: PetDetailScreen(item: item));
          },
        ),
        GoRoute(
          path: 'favorites',
          builder: (context, state) => const FavoritePetsScreen(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: 'nsa-adopt',
          builder: (context, state) => const NsaAdoptScreen(),
        ),
      ],
    ),
  ],
);
