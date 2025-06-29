import 'package:flutter/material.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';

class PetDetailScreen extends StatelessWidget {
  final AbandonmentItem item;
  const PetDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text(
          '상세 정보',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.colorScheme.background,
        foregroundColor: theme.colorScheme.primary,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          if (item.popfile1 != null && item.popfile1!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                item.popfile1!,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 240,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
          const SizedBox(height: 24),
          Text(
            item.kindFullNm ?? '품종 미상',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          if (item.happenPlace != null)
            Text('발견장소: ${item.happenPlace}', style: theme.textTheme.bodyLarge),
          if (item.happenDt != null)
            Text('발견일: ${item.happenDt}', style: theme.textTheme.bodyLarge),
          if (item.careNm != null)
            Text('보호소: ${item.careNm}', style: theme.textTheme.bodyLarge),
          if (item.careTel != null)
            Text('보호소 연락처: ${item.careTel}', style: theme.textTheme.bodyLarge),
          if (item.careAddr != null)
            Text('보호소 주소: ${item.careAddr}', style: theme.textTheme.bodyLarge),
          const SizedBox(height: 16),
          Row(
            children: [
              if (item.sexCd != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: item.sexCd == 'M'
                        ? Colors.orange[100]
                        : Colors.pink[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    item.sexCd == 'M' ? '수컷' : '암컷',
                    style: TextStyle(
                      color: item.sexCd == 'M'
                          ? Colors.orange[800]
                          : Colors.pink[800],
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(width: 12),
              if (item.neuterYn != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: item.neuterYn == 'Y'
                        ? Colors.deepOrange[100]
                        : Colors.orange[50],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    item.neuterYn == 'Y' ? '중성화' : '미중성화',
                    style: TextStyle(
                      color: item.neuterYn == 'Y'
                          ? Colors.deepOrange[800]
                          : Colors.orange[800],
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          if (item.age != null)
            Text('나이: ${item.age}', style: theme.textTheme.bodyLarge),
          if (item.weight != null)
            Text('몸무게: ${item.weight}', style: theme.textTheme.bodyLarge),
          if (item.colorCd != null)
            Text('색상: ${item.colorCd}', style: theme.textTheme.bodyLarge),
          if (item.specialMark != null)
            Text('특이사항: ${item.specialMark}', style: theme.textTheme.bodyLarge),
          if (item.noticeSdt != null && item.noticeEdt != null)
            Text(
              '공고기간: ${item.noticeSdt} ~ ${item.noticeEdt}',
              style: theme.textTheme.bodyLarge,
            ),
          if (item.processState != null)
            Text('상태: ${item.processState}', style: theme.textTheme.bodyLarge),
          if (item.desertionNo != null)
            Text('유기번호: ${item.desertionNo}', style: theme.textTheme.bodyLarge),
          if (item.kindNm != null)
            Text('품종명: ${item.kindNm}', style: theme.textTheme.bodyLarge),
          if (item.endReason != null)
            Text('종료사유: ${item.endReason}', style: theme.textTheme.bodyLarge),
          if (item.etcBigo != null)
            Text('기타: ${item.etcBigo}', style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
