import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_flutter/icons_flutter.dart';

class PetCard extends StatelessWidget {
  final AbandonmentItem pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/pets/detail', extra: pet);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 섹션
            if (pet.popfile1 != null && pet.popfile1!.isNotEmpty)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pet.popfile1!,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 140,
                        color: AppColors.divider,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 140,
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
                  // 축종 칩 (좌측 상단)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
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
                  if (pet.processState != null)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: pet.processState == '공고중'
                              ? Colors.blue.withOpacity(0.9)
                              : Colors.green.withOpacity(0.9),
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
                ],
              ),

            // 정보 섹션
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 발견 정보
                  if (pet.happenPlace != null && pet.happenPlace!.isNotEmpty)
                    Text(
                      pet.happenPlace!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  if (pet.happenDt != null)
                    Text(
                      '발견일: ${_formatDate(pet.happenDt!)}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),

                  if (pet.careNm != null && pet.careNm!.isNotEmpty)
                    Text(
                      pet.careNm!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.tossBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  const SizedBox(height: 8),

                  // 하단 칩들
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      if (pet.sexCd != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: pet.sexCd == 'M'
                                ? Colors.orange.withOpacity(0.1)
                                : Colors.pink.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: pet.sexCd == 'M'
                                  ? Colors.orange.withOpacity(0.3)
                                  : Colors.pink.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            pet.sexCd == 'M' ? '수컷' : '암컷',
                            style: TextStyle(
                              fontSize: 10,
                              color: pet.sexCd == 'M'
                                  ? Colors.orange[700]
                                  : Colors.pink[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      if (pet.neuterYn != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: pet.neuterYn == 'Y'
                                ? Colors.deepOrange.withOpacity(0.1)
                                : Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: pet.neuterYn == 'Y'
                                  ? Colors.deepOrange.withOpacity(0.3)
                                  : Colors.orange.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            pet.neuterYn == 'Y' ? '중성화' : '미중성화',
                            style: TextStyle(
                              fontSize: 10,
                              color: pet.neuterYn == 'Y'
                                  ? Colors.deepOrange[700]
                                  : Colors.orange[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String date) {
    if (date.length == 8) {
      // YYYYMMDD 형식을 YYYY-MM-DD로 변환
      return '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';
    }
    return date;
  }

  String _formatKindName(String? kindFullNm) {
    if (kindFullNm == null || kindFullNm.isEmpty) {
      return '품종 미상';
    }

    // [개]를 제거
    String formatted = kindFullNm.replaceAll('[개]', '');
    // [고양이]를 제거
    formatted = formatted.replaceAll('[고양이]', '');

    return formatted;
  }

  IconData _getPetIcon(String? upKindCd) {
    switch (upKindCd) {
      case '417000': // 개
        return MaterialCommunityIcons.dog;
      case '422400': // 고양이
        return MaterialCommunityIcons.cat;
      case '429900': // 기타
        return MaterialCommunityIcons.paw;
      default:
        return MaterialCommunityIcons.paw;
    }
  }
}
