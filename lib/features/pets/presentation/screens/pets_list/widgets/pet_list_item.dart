import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pet_thumbnail.dart';

class PetListItem extends StatefulWidget {
  final AbandonmentItem pet;
  final VoidCallback onTap;

  const PetListItem({super.key, required this.pet, required this.onTap});

  @override
  State<PetListItem> createState() => _PetListItemState();
}

class _PetListItemState extends State<PetListItem> {
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
  void didUpdateWidget(PetListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 위젯이 업데이트될 때 관심 상태 새로고침
    _loadFavoriteState();
  }

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
      onTap: widget.onTap,
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
            Row(
              children: [
                // 공통 섬네일 위젯 사용
                PetThumbnail(
                  pet: widget.pet,
                  width: 120,
                  height: 120,
                  borderRadius: 12,
                  showKindChip: true,
                  showStateChip: true,
                  padding: const EdgeInsets.all(4),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Padding(
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
                ),
                Icon(Icons.chevron_right, color: AppColors.gray),
                SizedBox(width: 8),
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
}
