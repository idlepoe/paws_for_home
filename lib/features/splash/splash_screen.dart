import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/core/services/preload_provider.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _preload();
  }

  Future<void> _preload() async {
    await ref.read(preloadProvider);
    if (mounted) {
      context.go('/pets');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 64, color: AppColors.tossBlue),
            const SizedBox(height: 24),
            const Text(
              'Paws for Home',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.tossBlue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '데이터를 불러오는 중입니다...',
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(color: AppColors.tossBlue),
          ],
        ),
      ),
    );
  }
}
