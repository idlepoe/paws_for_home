import 'package:flutter/material.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/pet_image_gallery.dart';
import 'widgets/pet_info_card.dart';

class PetDetailScreen extends StatefulWidget {
  final AbandonmentItem item;
  const PetDetailScreen({super.key, required this.item});

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  String _formatDate(String date) {
    if (date.length == 8) {
      return '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';
    }
    return date;
  }

  void _showAdoptionInquiryBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.7,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 핸들 바
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 제목
                  const Text(
                    '입양 문의',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '아래 보호소 정보로 문의해주세요',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 기본 정보 카드
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '기본 정보',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // 품종
                        if (widget.item.kindFullNm != null &&
                            widget.item.kindFullNm!.isNotEmpty)
                          _buildInfoRow('품종', widget.item.kindFullNm!)
                        else if (widget.item.kindNm != null &&
                            widget.item.kindNm!.isNotEmpty)
                          _buildInfoRow('품종', widget.item.kindNm!),

                        // 공고번호
                        if (widget.item.noticeNo != null &&
                            widget.item.noticeNo!.isNotEmpty)
                          _buildInfoRow('공고번호', widget.item.noticeNo!),

                        // 유기번호
                        if (widget.item.desertionNo != null &&
                            widget.item.desertionNo!.isNotEmpty)
                          _buildInfoRow('유기번호', widget.item.desertionNo!),

                        // 상태
                        if (widget.item.processState != null &&
                            widget.item.processState!.isNotEmpty)
                          _buildInfoRow('상태', widget.item.processState!),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 보호소 정보 카드
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '보호소 정보',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // 보호소명
                        if (widget.item.careNm != null &&
                            widget.item.careNm!.isNotEmpty)
                          _buildInfoRow('보호소명', widget.item.careNm!),

                        // 보호소 주소
                        if (widget.item.careAddr != null &&
                            widget.item.careAddr!.isNotEmpty)
                          _buildInfoRow('보호소 주소', widget.item.careAddr!),

                        // 보호소 전화
                        if (widget.item.careTel != null &&
                            widget.item.careTel!.isNotEmpty)
                          _buildInfoRow(
                            '보호소 전화',
                            widget.item.careTel!,
                            isPhone: true,
                          ),

                        // 보호 시작일
                        if (widget.item.noticeSdt != null)
                          _buildInfoRow(
                            '보호 시작일',
                            _formatDate(widget.item.noticeSdt!),
                          ),

                        // 보호 종료일
                        if (widget.item.noticeEdt != null)
                          _buildInfoRow(
                            '보호 종료일',
                            _formatDate(widget.item.noticeEdt!),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 안내 문구
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '💡 입양 문의 시 참고사항',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '• 공고번호를 언급하여 문의해주세요\n'
                          '• 반려동물의 상태를 확인해주세요\n'
                          '• 입양 절차와 필요한 서류를 문의해주세요\n'
                          '• 방문 가능한 시간을 미리 확인해주세요',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: isPhone
                ? GestureDetector(
                    onTap: () => _makePhoneCall(value),
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.tossBlue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                : Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
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
          // 이미지 갤러리
          PetImageGallery(item: widget.item),

          // 기본 정보
          PetInfoCard(
            title: '기본 정보',
            children: [
              PetInfoRow(
                label: '품종',
                value: widget.item.kindFullNm ?? widget.item.kindNm,
              ),
              PetInfoRow(label: '공고번호', value: widget.item.noticeNo),
              PetInfoRow(label: '유기번호', value: widget.item.desertionNo),
              PetInfoRow(label: 'RFID', value: widget.item.rfidCd),
              PetInfoRow(label: '상태', value: widget.item.processState),
              PetStatusChips(item: widget.item),
            ],
          ),

          // 발견 정보
          PetInfoCard(
            title: '발견 정보',
            children: [
              PetInfoRow(
                label: '발견일',
                value: widget.item.happenDt != null
                    ? _formatDate(widget.item.happenDt!)
                    : null,
              ),
              PetInfoRow(label: '발견장소', value: widget.item.happenPlace),
              PetInfoRow(label: '특징', value: widget.item.specialMark),
              PetInfoRow(label: '색상', value: widget.item.colorCd),
              PetInfoRow(label: '나이', value: widget.item.age),
              PetInfoRow(label: '체중', value: widget.item.weight),
            ],
          ),

          // 보호 정보
          PetInfoCard(
            title: '보호 정보',
            children: [
              PetInfoRow(label: '보호소명', value: widget.item.careNm),
              PetInfoRow(label: '보호소 주소', value: widget.item.careAddr),
              PetInfoRow(label: '보호소 전화', value: widget.item.careTel),
              PetInfoRow(
                label: '보호 시작일',
                value: widget.item.noticeSdt != null
                    ? _formatDate(widget.item.noticeSdt!)
                    : null,
              ),
              PetInfoRow(
                label: '보호 종료일',
                value: widget.item.noticeEdt != null
                    ? _formatDate(widget.item.noticeEdt!)
                    : null,
              ),
            ],
          ),

          // 기타 정보
          PetInfoCard(
            title: '기타 정보',
            children: [
              PetInfoRow(
                label: '공고일',
                value: widget.item.noticeNo != null
                    ? _formatDate(widget.item.noticeNo!)
                    : null,
              ),
              PetInfoRow(label: '관할기관', value: widget.item.orgNm),
            ],
          ),
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
          onPressed: _showAdoptionInquiryBottomSheet,
          child: const Text('입양 문의하기'),
        ),
      ),
    );
  }
}
