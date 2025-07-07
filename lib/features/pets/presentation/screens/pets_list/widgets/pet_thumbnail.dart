import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:icons_flutter/icons_flutter.dart';

class PetThumbnail extends StatelessWidget {
  final AbandonmentItem pet;
  final double width;
  final double height;
  final double borderRadius;
  final bool showKindChip;
  final bool showStateChip;
  final EdgeInsets? padding;

  const PetThumbnail({
    super.key,
    required this.pet,
    this.width = 80,
    this.height = 80,
    this.borderRadius = 12,
    this.showKindChip = true,
    this.showStateChip = true,
    this.padding,
  });

  IconData _getPetIcon(String? upKindCd) {
    switch (upKindCd) {
      case '417000': // 개
        return Icons.pets;
      case '422400': // 고양이
        return Icons.pets;
      case '429900': // 기타
        return Icons.pets;
      default:
        return Icons.pets;
    }
  }

  String _formatKindName(String? kindFullNm) {
    if (kindFullNm == null || kindFullNm.isEmpty) return '품종 미상';

    // [개], [고양이], [기타축종] 제거
    String formatted = kindFullNm
        .replaceAll('[개]', '')
        .replaceAll('[고양이]', '')
        .replaceAll('[기타축종]', '')
        .trim();

    // 품종명에서 축종과 견종을 분리
    final parts = formatted.split(' ');
    if (parts.length >= 2) {
      return '${parts[0]} ${parts[1]}';
    }
    return formatted;
  }

  // 공고 마감일까지 남은 일수 계산
  int _getRemainingDays(String noticeEdt) {
    try {
      // YYYYMMDD 형식을 DateTime으로 변환
      final year = int.parse(noticeEdt.substring(0, 4));
      final month = int.parse(noticeEdt.substring(4, 6));
      final day = int.parse(noticeEdt.substring(6, 8));
      final deadline = DateTime(year, month, day);

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final deadlineDate = DateTime(
        deadline.year,
        deadline.month,
        deadline.day,
      );

      return deadlineDate.difference(today).inDays;
    } catch (e) {
      return 0;
    }
  }

  // 남은 일수에 따른 색상 반환
  Color _getDeadlineColor(String noticeEdt) {
    final remainingDays = _getRemainingDays(noticeEdt);

    if (remainingDays < 0) {
      return Colors.red.withOpacity(0.9); // 마감됨
    } else if (remainingDays == 0) {
      return Colors.red.withOpacity(0.8); // 오늘까지
    } else if (remainingDays == 1) {
      return Colors.red.withOpacity(0.7); // 내일까지
    } else if (remainingDays <= 3) {
      return Colors.deepOrange.withOpacity(0.9); // 3일 이내
    } else if (remainingDays <= 7) {
      return Colors.amber.withOpacity(0.9); // 7일 이내
    } else {
      return Colors.green.withOpacity(0.9); // 7일 이상
    }
  }

  // 남은 일수에 따른 텍스트 반환
  String _getDeadlineText(String noticeEdt) {
    final remainingDays = _getRemainingDays(noticeEdt);

    if (remainingDays < 0) {
      return '마감됨';
    } else if (remainingDays == 0) {
      return '오늘까지';
    } else if (remainingDays == 1) {
      return '내일까지';
    } else {
      return '${remainingDays}일남음';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          // 이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              imageUrl: pet.popfile1 ?? '',
              width: width,
              height: height,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: width,
                height: height,
                color: AppColors.divider,
                child: const Center(
                  child: CircularProgressIndicator(strokeCap: StrokeCap.round),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: width,
                height: height,
                color: AppColors.gray,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: AppColors.textSecondary),
                    SizedBox(height: 4),
                    Text(
                      '이미지 로드 실패',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 축종/견종 칩 (좌측 상단)
          if (showKindChip)
            Positioned(
              top: padding?.top ?? 4,
              left: padding?.left ?? 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getPetIcon(pet.upKindCd),
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatKindName(pet.kindFullNm),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // 상태 칩 (좌측 하단)
          if (showStateChip && pet.processState != null)
            Positioned(
              bottom: padding?.bottom ?? 4,
              left: padding?.left ?? 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: pet.processState == '공고중'
                      ? Colors.blue.withOpacity(0.9)
                      : pet.processState == '보호중'
                      ? Colors.green.withOpacity(0.9)
                      : Colors.grey.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  pet.processState!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          // 공고 마감일 칩 (우측 하단)
          if (pet.noticeEdt != null)
            Positioned(
              bottom: padding?.bottom ?? 4,
              right: padding?.right ?? 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: _getDeadlineColor(pet.noticeEdt!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _getDeadlineText(pet.noticeEdt!),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
