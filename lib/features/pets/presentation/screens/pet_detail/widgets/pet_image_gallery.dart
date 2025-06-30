import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';

class PetImageGallery extends StatefulWidget {
  final AbandonmentItem item;

  const PetImageGallery({super.key, required this.item});

  @override
  State<PetImageGallery> createState() => _PetImageGalleryState();
}

class _PetImageGalleryState extends State<PetImageGallery> {
  String? _selectedImageUrl;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 메인 이미지
        if (widget.item.popfile1 != null && widget.item.popfile1!.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: _selectedImageUrl ?? widget.item.popfile1!,
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
      ],
    );
  }
}
