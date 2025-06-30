import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:url_launcher/url_launcher.dart';

import 'search_filter_screen.dart';

class PetDetailScreen extends StatefulWidget {
  final AbandonmentItem item;
  const PetDetailScreen({super.key, required this.item});

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  String? _selectedImageUrl;

  @override
  void initState() {
    super.initState();
    logger.d(widget.item);
    // 초기 선택된 이미지는 첫 번째 이미지
    _selectedImageUrl = widget.item.popfile1;
  }

  // 모든 이미지 URL을 가져오는 메서드
  List<String> get _allImages {
    final images = <String>{};

    // popfile1부터 popfile8까지 순서대로 추가 (중복 제거)
    if (widget.item.popfile1 != null && widget.item.popfile1!.isNotEmpty) {
      images.add(widget.item.popfile1!);
    }
    if (widget.item.popfile2 != null && widget.item.popfile2!.isNotEmpty) {
      images.add(widget.item.popfile2!);
    }
    if (widget.item.popfile3 != null && widget.item.popfile3!.isNotEmpty) {
      images.add(widget.item.popfile3!);
    }
    if (widget.item.popfile4 != null && widget.item.popfile4!.isNotEmpty) {
      images.add(widget.item.popfile4!);
    }
    if (widget.item.popfile5 != null && widget.item.popfile5!.isNotEmpty) {
      images.add(widget.item.popfile5!);
    }
    if (widget.item.popfile6 != null && widget.item.popfile6!.isNotEmpty) {
      images.add(widget.item.popfile6!);
    }
    if (widget.item.popfile7 != null && widget.item.popfile7!.isNotEmpty) {
      images.add(widget.item.popfile7!);
    }
    if (widget.item.popfile8 != null && widget.item.popfile8!.isNotEmpty) {
      images.add(widget.item.popfile8!);
    }

    return images.toList();
  }

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
          if (widget.item.popfile1 != null && widget.item.popfile1!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: widget.item.popfile1!,
                width: double.infinity,
                fit: BoxFit.fitWidth,
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

          // 추가 사진 갤러리
          if (_allImages.length > 1)
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _allImages.length,
                itemBuilder: (context, index) {
                  final imageUrl = _allImages[index];
                  final isSelected = _selectedImageUrl == imageUrl;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImageUrl = imageUrl;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? AppColors.tossBlue
                              : AppColors.border,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.divider,
                            child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.gray,
                            child: const Center(
                              child: Icon(
                                Icons.error,
                                color: AppColors.textSecondary,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          if (_allImages.length > 1) const SizedBox(height: 16),

          _buildInfoCard('기본 정보', [
            _buildInfoRow('품종', widget.item.kindFullNm ?? widget.item.kindNm),
            _buildInfoRow('공고번호', widget.item.noticeNo),
            _buildInfoRow('유기번호', widget.item.desertionNo),
            _buildInfoRow('RFID', widget.item.rfidCd),
            _buildInfoRow('상태', widget.item.processState),
            Row(
              children: [
                if (widget.item.sexCd != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: widget.item.sexCd == 'M'
                          ? Colors.orange[100]
                          : Colors.pink[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.item.sexCd == 'M' ? '수컷' : '암컷',
                      style: TextStyle(
                        color: widget.item.sexCd == 'M'
                            ? Colors.orange[800]
                            : Colors.pink[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                if (widget.item.neuterYn != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: widget.item.neuterYn == 'Y'
                          ? Colors.deepOrange[100]
                          : Colors.orange[50],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.item.neuterYn == 'Y' ? '중성화' : '미중성화',
                      style: TextStyle(
                        color: widget.item.neuterYn == 'Y'
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
              widget.item.happenDt != null
                  ? _formatDate(widget.item.happenDt!)
                  : null,
            ),
            _buildInfoRow('발견장소', widget.item.happenPlace),
            _buildInfoRow('특징', widget.item.specialMark),
            _buildInfoRow('색상', widget.item.colorCd),
            _buildInfoRow('나이', widget.item.age),
            _buildInfoRow('체중', widget.item.weight),
          ]),

          _buildInfoCard('보호 정보', [
            _buildInfoRow('보호소명', widget.item.careNm),
            _buildInfoRow('보호소 주소', widget.item.careAddr),
            _buildInfoRow('보호소 전화', widget.item.careTel),
            _buildInfoRow(
              '보호 시작일',
              widget.item.noticeSdt != null
                  ? _formatDate(widget.item.noticeSdt!)
                  : null,
            ),
            _buildInfoRow(
              '보호 종료일',
              widget.item.noticeEdt != null
                  ? _formatDate(widget.item.noticeEdt!)
                  : null,
            ),
          ]),

          _buildInfoCard('기타 정보', [
            _buildInfoRow(
              '공고일',
              widget.item.noticeNo != null
                  ? _formatDate(widget.item.noticeNo!)
                  : null,
            ),
            _buildInfoRow('관할기관', widget.item.orgNm),
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
