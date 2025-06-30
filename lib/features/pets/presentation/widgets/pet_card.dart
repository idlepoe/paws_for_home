import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';

class PetCard extends StatelessWidget {
  final AbandonmentItem pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: pet.processState == '공고중'
              ? Colors.blue.withOpacity(0.3)
              : Colors.green.withOpacity(0.3),
          width: 1,
        ),
      ),
      color: pet.processState == '공고중' ? Colors.blue[50] : Colors.green[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (pet.popfile1 != null && pet.popfile1!.isNotEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: pet.popfile1!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                placeholder: (context, url) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        '이미지를 불러올 수 없습니다',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      pet.upKindCd == '417000'
                          ? Icons.pets
                          : Icons.pets_outlined,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        pet.kindFullNm ?? '품종 미상',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (pet.happenPlace != null)
                  Text(
                    '발견장소: ${pet.happenPlace}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                if (pet.happenDt != null)
                  Text(
                    '발견일: ${_formatDate(pet.happenDt!)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                if (pet.careNm != null)
                  Text(
                    '보호소: ${pet.careNm}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // processState chip을 제일 왼쪽에 우선 표시
                    if (pet.processState != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: pet.processState == '공고중'
                              ? Colors.blue[100]
                              : Colors.green[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          pet.processState ?? '상태미상',
                          style: TextStyle(
                            color: pet.processState == '공고중'
                                ? Colors.blue[800]
                                : Colors.green[800],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (pet.processState != null) const SizedBox(width: 8),
                    if (pet.sexCd != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: pet.sexCd == 'M'
                              ? Colors.orange[100]
                              : Colors.pink[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          pet.sexCd == 'M' ? '수컷' : '암컷',
                          style: TextStyle(
                            color: pet.sexCd == 'M'
                                ? Colors.orange[800]
                                : Colors.pink[800],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    if (pet.neuterYn != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: pet.neuterYn == 'Y'
                              ? Colors.deepOrange[100]
                              : Colors.orange[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          pet.neuterYn == 'Y' ? '중성화' : '미중성화',
                          style: TextStyle(
                            color: pet.neuterYn == 'Y'
                                ? Colors.deepOrange[800]
                                : Colors.orange[800],
                            fontSize: 12,
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
