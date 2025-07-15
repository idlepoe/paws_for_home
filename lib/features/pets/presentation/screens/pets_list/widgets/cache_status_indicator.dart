import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/features/pets/presentation/providers/pet_providers.dart';

class CacheStatusIndicator extends ConsumerStatefulWidget {
  const CacheStatusIndicator({super.key});

  @override
  ConsumerState<CacheStatusIndicator> createState() =>
      _CacheStatusIndicatorState();
}

class _CacheStatusIndicatorState extends ConsumerState<CacheStatusIndicator> {
  bool _showRefreshMessage = false;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    // 화면 진입 시 갱신 메시지 표시
    _showRefreshMessageForDuration();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _showRefreshMessageForDuration() {
    setState(() {
      _showRefreshMessage = true;
    });

    // 3초 후 메시지 숨기기
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showRefreshMessage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 백그라운드 새로고침 상태 확인
    final isRefreshingInBackground = ref
        .watch(petsProvider.notifier)
        .isRefreshingInBackground;

    // 백그라운드 새로고침 중이거나 초기 메시지 표시 중일 때만 표시
    if (!_showRefreshMessage && !isRefreshingInBackground) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '최신 데이터로 갱신 중...',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
