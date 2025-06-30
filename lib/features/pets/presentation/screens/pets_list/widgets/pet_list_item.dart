import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';

class PetListItem extends StatelessWidget {
  final AbandonmentItem pet;
  final VoidCallback onTap;

  const PetListItem({super.key, required this.pet, required this.onTap});

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '-';
    try {
      // YYYYMMDD 형식을 YYYY-MM-DD로 변환
      if (dateStr.length == 8) {
        return '${dateStr.substring(0, 4)}-${dateStr.substring(4, 6)}-${dateStr.substring(6, 8)}';
      }
      return dateStr;
    } catch (e) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // 이미지 + processState 칩 Stack
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: pet.popfile1 ?? '',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: 80,
                      height: 80,
                      color: AppColors.divider,
                      child: Icon(Icons.image, color: AppColors.textSecondary),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 80,
                      height: 80,
                      color: AppColors.gray,
                      child: Icon(Icons.error, color: AppColors.textSecondary),
                    ),
                  ),
                ),
                if (pet.processState != null)
                  Positioned(
                    left: 4,
                    bottom: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: pet.processState == '공고중'
                            ? AppColors.tossBlue.withOpacity(0.85)
                            : pet.processState == '보호중'
                            ? Colors.green.withOpacity(0.85)
                            : Colors.grey.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        pet.processState!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.kindFullNm ?? '품종 미상',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '발견일: ${_formatDate(pet.happenDt)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    Text(
                      '발견장소: ${pet.happenPlace ?? '-'}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    Text(
                      '보호소: ${pet.careNm ?? '-'}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.tossBlue,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.gray),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
