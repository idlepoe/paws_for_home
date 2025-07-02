import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:url_launcher/url_launcher.dart';

class PetInfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const PetInfoCard({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
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
}

class PetInfoRow extends StatelessWidget {
  final String label;
  final String? value;

  const PetInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox.shrink();

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
                Row(
                  children: [
                    Expanded(
                      child: label == '보호소 전화'
                          ? GestureDetector(
                              onTap: () => _makePhoneCall(value!),
                              child: Text(
                                value!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.tossBlue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          : Text(
                              value!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.textPrimary,
                              ),
                            ),
                    ),
                    if (label == '공고번호' || label == '유기번호')
                      GestureDetector(
                        onTap: () => _copyToClipboard(context, value!),
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.tossBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.tossBlue.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.copy,
                            size: 16,
                            color: AppColors.tossBlue,
                          ),
                        ),
                      ),
                  ],
                ),
                if ((label == '보호소 주소' || label == '발견장소') && value!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        _buildMapButton('구글', 'assets/icon/google_map.png', () {
                          final url =
                              'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(value!)}';
                          launchUrl(
                            Uri.parse(url),
                            mode: LaunchMode.externalApplication,
                          );
                        }),
                        const SizedBox(width: 8),
                        _buildMapButton('네이버', 'assets/icon/naver_map.png', () {
                          final url =
                              'https://map.naver.com/v5/search/${Uri.encodeComponent(value!)}?c=15,0,0,0,dh';
                          launchUrl(
                            Uri.parse(url),
                            mode: LaunchMode.externalApplication,
                          );
                        }),
                        const SizedBox(width: 8),
                        _buildMapButton('카카오', 'assets/icon/kakao_map.png', () {
                          final url =
                              'https://map.kakao.com/link/search/${Uri.encodeComponent(value!)}';
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

  void _copyToClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$label이 클립보드에 복사되었습니다'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.tossBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
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
}

class PetStatusChips extends StatelessWidget {
  final AbandonmentItem item;

  const PetStatusChips({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (item.sexCd != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: item.sexCd == 'M' ? Colors.orange[100] : Colors.pink[100],
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
    );
  }
}
