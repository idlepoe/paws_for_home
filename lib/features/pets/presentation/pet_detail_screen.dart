import 'package:flutter/material.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:url_launcher/url_launcher.dart';

class PetDetailScreen extends StatelessWidget {
  final AbandonmentItem item;
  const PetDetailScreen({super.key, required this.item});

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontSize: 16)),
                // 주소인 경우 지도 버튼 추가
                if ((label == '주소' || label == '발견장소' || label == '보호소명') &&
                    value.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        _buildMapButton('구글', 'assets/icon/google_map.png', () {
                          final url =
                              'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(value)}';
                          launchUrl(
                            Uri.parse(url),
                            mode: LaunchMode.externalApplication,
                          );
                        }),
                        const SizedBox(width: 8),
                        _buildMapButton('네이버', 'assets/icon/naver_map.png', () {
                          final url =
                              'https://map.naver.com/v5/search/${Uri.encodeComponent(value)}?c=15,0,0,0,dh';
                          launchUrl(
                            Uri.parse(url),
                            mode: LaunchMode.externalApplication,
                          );
                        }),
                        const SizedBox(width: 8),
                        _buildMapButton('카카오', 'assets/icon/kakao_map.png', () {
                          final url =
                              'https://map.kakao.com/link/search/${Uri.encodeComponent(value)}';
                          launchUrl(
                            Uri.parse(url),
                            mode: LaunchMode.externalApplication,
                          );
                        }),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapButton(String label, String iconPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 아이콘이 없는 경우 텍스트로 대체
            Text(
              label == '구글'
                  ? 'G'
                  : label == '네이버'
                  ? 'N'
                  : 'K',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: label == '구글'
                    ? Colors.blue
                    : label == '네이버'
                    ? Colors.green
                    : Colors.yellow[800],
              ),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        padding: const EdgeInsets.all(16),
        children: [
          // 이미지 섹션
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

          const SizedBox(height: 16),

          // 기본 정보 카드
          _buildInfoCard('기본 정보', [
            _buildInfoRow('품종', item.kindFullNm ?? item.kindNm),
            _buildInfoRow('공고번호', item.noticeNo),
            _buildInfoRow('유기번호', item.desertionNo),
            _buildInfoRow('RFID', item.rfidCd),
            _buildInfoRow('상태', item.processState),
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
          ]),

          // 발견 정보 카드
          _buildInfoCard('발견 정보', [
            _buildInfoRow('발견장소', item.happenPlace),
            _buildInfoRow('발견일', item.happenDt),
            _buildInfoRow('나이', item.age),
            _buildInfoRow('몸무게', item.weight),
            _buildInfoRow('색상', item.colorCd),
            _buildInfoRow('특이사항', item.specialMark),
          ]),

          // 보호소 정보 카드
          _buildInfoCard('보호소 정보', [
            _buildInfoRow('보호소명', item.careNm),
            _buildInfoRow('등록번호', item.careRegNo),
            _buildInfoRow('연락처', item.careTel),
            _buildInfoRow('주소', item.careAddr),
            _buildInfoRow('소유자', item.careOwnerNm),
            _buildInfoRow('기관명', item.orgNm),
          ]),

          // 공고 정보 카드
          _buildInfoCard('공고 정보', [
            _buildInfoRow('공고시작일', item.noticeSdt),
            _buildInfoRow('공고종료일', item.noticeEdt),
            _buildInfoRow('종료사유', item.endReason),
            _buildInfoRow('업데이트', item.updTm),
          ]),

          // 건강 정보 카드
          _buildInfoCard('건강 정보', [
            _buildInfoRow('예방접종', item.vaccinationChk),
            _buildInfoRow('건강검진', item.healthChk),
            _buildInfoRow('사회화', item.sfeSoci),
            _buildInfoRow('건강상태', item.sfeHealth),
          ]),

          // 품종 정보 카드
          _buildInfoCard('품종 정보', [
            _buildInfoRow('상위품종코드', item.upKindCd),
            _buildInfoRow('상위품종명', item.upKindNm),
            _buildInfoRow('품종코드', item.kindCd),
            _buildInfoRow('품종명', item.kindNm),
            _buildInfoRow('전체품종명', item.kindFullNm),
          ]),

          // 기타 정보 카드
          _buildInfoCard('기타 정보', [
            _buildInfoRow('기타', item.etcBigo),
            _buildInfoRow('서비스텍스트', item.srvcTxt),
            _buildInfoRow('후원종료일', item.sprtEDate),
          ]),

          // 추가 이미지들 (있는 경우)
          if (item.popfile2 != null && item.popfile2!.isNotEmpty ||
              item.popfile3 != null && item.popfile3!.isNotEmpty ||
              item.popfile4 != null && item.popfile4!.isNotEmpty)
            _buildInfoCard('추가 이미지', [
              if (item.popfile2 != null && item.popfile2!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.popfile2!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
              if (item.popfile3 != null && item.popfile3!.isNotEmpty) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.popfile3!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
              if (item.popfile4 != null && item.popfile4!.isNotEmpty) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.popfile4!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ]),
        ],
      ),
    );
  }
}
