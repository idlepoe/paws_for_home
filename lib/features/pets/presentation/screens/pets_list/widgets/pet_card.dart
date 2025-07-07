import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pet_thumbnail.dart';

class PetCard extends StatefulWidget {
  final AbandonmentItem pet;

  const PetCard({super.key, required this.pet});

  @override
  State<PetCard> createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorite_pets') ?? [];
    setState(() {
      _isFavorite = favorites.contains(widget.pet.desertionNo ?? '');
    });
  }

  // 관심 상태를 새로고침하는 메서드
  Future<void> refreshFavoriteState() async {
    await _loadFavoriteState();
  }

  @override
  void didUpdateWidget(PetCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 위젯이 업데이트될 때 관심 상태 새로고침
    _loadFavoriteState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // 상세 화면으로 진입하고 결과를 기다림
        await context.push('/pets/detail', extra: widget.pet);
        // 상세 화면에서 돌아온 후 관심 상태 새로고침
        if (mounted) {
          await refreshFavoriteState();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: _isFavorite
              ? Border.all(color: AppColors.tossBlue, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이미지 섹션
                if (widget.pet.popfile1 != null &&
                    widget.pet.popfile1!.isNotEmpty)
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: PetThumbnail(
                      pet: widget.pet,
                      width: double.infinity,
                      height: 140,
                      borderRadius: 0,
                      showKindChip: true,
                      showStateChip: true,
                      padding: const EdgeInsets.all(8),
                    ),
                  ),

                // 정보 섹션
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 발견 정보
                      if (widget.pet.happenPlace != null &&
                          widget.pet.happenPlace!.isNotEmpty)
                        Text(
                          widget.pet.happenPlace!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                      if (widget.pet.happenDt != null)
                        Text(
                          '발견일: ${_formatDate(widget.pet.happenDt!)}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),

                      if (widget.pet.careNm != null &&
                          widget.pet.careNm!.isNotEmpty)
                        Text(
                          widget.pet.careNm!,
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
                          if (widget.pet.sexCd != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: widget.pet.sexCd == 'M'
                                    ? Colors.orange.withOpacity(0.1)
                                    : Colors.pink.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: widget.pet.sexCd == 'M'
                                      ? Colors.orange.withOpacity(0.3)
                                      : Colors.pink.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                widget.pet.sexCd == 'M' ? '수컷' : '암컷',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: widget.pet.sexCd == 'M'
                                      ? Colors.orange[700]
                                      : Colors.pink[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          if (widget.pet.neuterYn != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: widget.pet.neuterYn == 'Y'
                                    ? Colors.deepOrange.withOpacity(0.1)
                                    : Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: widget.pet.neuterYn == 'Y'
                                      ? Colors.deepOrange.withOpacity(0.3)
                                      : Colors.orange.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                widget.pet.neuterYn == 'Y' ? '중성화' : '미중성화',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: widget.pet.neuterYn == 'Y'
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

            // 관심동물 표시 (우측 상단)
            if (_isFavorite)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.tossBlue,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: const Text(
                    '관심',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
}
