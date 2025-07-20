import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/core/services/preload_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:logger/logger.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // 앱 업데이트 확인
      await _checkForUpdate();

      // 데이터 프리로드
      await _preload();

      if (mounted) {
        context.go('/pets');
      }
    } catch (e) {
      logger.e('앱 초기화 중 오류 발생: $e');
      if (mounted) {
        context.go('/pets');
      }
    }
  }

  Future<void> _checkForUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        logger.i('업데이트 가능: ${info.immediateUpdateAllowed}');

        if (info.immediateUpdateAllowed) {
          // 즉시 업데이트 가능한 경우
          await InAppUpdate.performImmediateUpdate();
        } else if (info.flexibleUpdateAllowed) {
          // 유연한 업데이트 가능한 경우
          await InAppUpdate.startFlexibleUpdate();
        }
      } else {
        logger.d('업데이트 없음');
      }
    } catch (e) {
      logger.e('업데이트 확인 중 오류: $e');
    }
  }

  Future<void> _preload() async {
    await ref.read(preloadProvider);
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
            const CircularProgressIndicator(
              color: AppColors.tossBlue,
              strokeCap: StrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
