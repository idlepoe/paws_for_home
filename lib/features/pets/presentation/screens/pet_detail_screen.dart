import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:url_launcher/url_launcher.dart';

class PetDetailScreen extends StatelessWidget {
  final AbandonmentItem item;
  const PetDetailScreen({super.key, required this.item});

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
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
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
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
          color: AppColors.divider,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                    ? AppColors.tossBlue
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
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          '상세 정보',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (item.popfile1 != null && item.popfile1!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: item.popfile1!,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                placeholder: (context, url) => Container(
                  height: 240,
                  color: AppColors.divider,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 240,
                  color: AppColors.gray,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: AppColors.textSecondary),
                      SizedBox(height: 8),
                      Text(
                        '이미지를 불러올 수 없습니다',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          const SizedBox(height: 16),

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
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
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
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ]),

          _buildInfoCard('발견 정보', [
            _buildInfoRow(
              '발견일',
              item.happenDt != null ? _formatDate(item.happenDt!) : null,
            ),
            _buildInfoRow('발견장소', item.happenPlace),
            _buildInfoRow('특징', item.specialMark),
            _buildInfoRow('색상', item.colorCd),
            _buildInfoRow('나이', item.age),
            _buildInfoRow('체중', item.weight),
          ]),

          _buildInfoCard('보호 정보', [
            _buildInfoRow('보호소명', item.careNm),
            _buildInfoRow('보호소 주소', item.careAddr),
            _buildInfoRow('보호소 전화', item.careTel),
            _buildInfoRow(
              '보호 시작일',
              item.noticeSdt != null ? _formatDate(item.noticeSdt!) : null,
            ),
            _buildInfoRow(
              '보호 종료일',
              item.noticeEdt != null ? _formatDate(item.noticeEdt!) : null,
            ),
          ]),

          _buildInfoCard('기타 정보', [
            _buildInfoRow(
              '공고일',
              item.noticeNo != null ? _formatDate(item.noticeNo!) : null,
            ),
            _buildInfoRow('관할기관', item.orgNm),
          ]),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.tossBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: Size(double.infinity, 48),
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onPressed: () {},
          child: const Text('입양 문의하기'),
        ),
      ),
    );
  }

  String _formatDate(String date) {
    if (date.length == 8) {
      return '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';
    }
    return date;
  }
}
