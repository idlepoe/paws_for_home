import 'package:flutter/material.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
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
          onPressed: () {},
          child: const Text('입양 문의하기'),
        ),
      ),
    );
  }
}
