import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';
import 'package:paws_for_home/shared/models/abandonment_response.dart';
import 'package:paws_for_home/features/pets/data/repositories/pet_repository_impl.dart';
import 'package:paws_for_home/features/pets/data/datasources/pet_remote_data_source.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'widgets/pet_image_gallery.dart';
import 'widgets/pet_info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetDetailScreen extends StatefulWidget {
  final AbandonmentItem item;
  const PetDetailScreen({super.key, required this.item});

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  AbandonmentItem? _currentItem;
  bool _isLoading = false;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // 전달받은 데이터를 우선 표시
    _currentItem = widget.item;
    // API로 최신 정보 갱신
    _refreshPetData();
  }

  Future<void> _refreshPetData() async {
    if (widget.item.noticeNo == null || widget.item.noticeNo!.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
      _hasError = false;
      _errorMessage = null;
    });

    try {
      final apiService = AbandonmentApiService();
      final dataSource = PetRemoteDataSourceImpl(apiService);
      final repository = PetRepositoryImpl(dataSource);

      final petList = await repository.getPets(
        numOfRows: '1',
        pageNo: '1',
        noticeNo: widget.item.noticeNo,
      );

      if (petList.isNotEmpty) {
        final updatedPet = petList.first;
        setState(() {
          _currentItem = updatedPet;
          _isLoading = false;
        });

        // 관심 등록된 동물인 경우 최신 데이터로 갱신
        await _updateFavoritePetData(updatedPet);
      } else {
        setState(() {
          _hasError = true;
          _errorMessage = '최신 정보를 찾을 수 없습니다.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = '정보를 불러오는 중 오류가 발생했습니다.';
        _isLoading = false;
      });
    }
  }

  String _formatDate(String? date) {
    if (date == null || date.length != 8) return '';
    return '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';
  }

  Future<void> _updateFavoritePetData(AbandonmentItem updatedPet) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList('favorite_pets') ?? [];

      // 현재 동물이 관심 등록되어 있는지 확인
      final originalDesertionNo = widget.item.desertionNo;
      if (originalDesertionNo != null &&
          favorites.contains(originalDesertionNo)) {
        // 관심 목록에서 기존 desertionNo 제거
        favorites.remove(originalDesertionNo);

        // 새로운 desertionNo가 있으면 추가 (없으면 그대로 제거됨)
        final newDesertionNo = updatedPet.desertionNo;
        if (newDesertionNo != null && newDesertionNo.isNotEmpty) {
          favorites.add(newDesertionNo);
        }

        // 업데이트된 관심 목록 저장
        await prefs.setStringList('favorite_pets', favorites);
      }
    } catch (e) {
      // 에러 발생 시 무시 (관심 목록 업데이트 실패가 전체 기능에 영향을 주지 않도록)
      print('Failed to update favorite pet data: $e');
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
        iconTheme: const IconThemeData(color: AppColors.tossBlue),
        actions: [
          if (_hasError)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _refreshPetData,
            ),
        ],
      ),
      body: _currentItem == null
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeCap: StrokeCap.round,
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // 로딩 또는 에러 상태 표시
                if (_isLoading)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.tossBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.tossBlue.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.tossBlue,
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          '최신 정보를 불러오는 중...',
                          style: TextStyle(
                            color: AppColors.tossBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_hasError)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 16,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _errorMessage ?? '오류가 발생했습니다.',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _refreshPetData,
                          child: const Text(
                            '다시 시도',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // 이미지 갤러리
                PetImageGallery(item: _currentItem!),

                // 기본 정보
                PetInfoCard(
                  title: '기본 정보',
                  children: [
                    PetInfoRow(
                      label: '품종',
                      value: _currentItem!.kindFullNm ?? _currentItem!.kindNm,
                    ),
                    PetInfoRow(label: '공고번호', value: _currentItem!.noticeNo),
                    PetInfoRow(label: '유기번호', value: _currentItem!.desertionNo),
                    PetInfoRow(label: 'RFID', value: _currentItem!.rfidCd),
                    PetInfoRow(label: '상태', value: _currentItem!.processState),
                    PetStatusChips(item: _currentItem!),
                  ],
                ),

                // 발견 정보
                PetInfoCard(
                  title: '발견 정보',
                  children: [
                    PetInfoRow(
                      label: '발견일',
                      value: _currentItem!.happenDt != null
                          ? _formatDate(_currentItem!.happenDt!)
                          : null,
                    ),
                    PetInfoRow(label: '발견장소', value: _currentItem!.happenPlace),
                    PetInfoRow(label: '특징', value: _currentItem!.specialMark),
                    PetInfoRow(label: '색상', value: _currentItem!.colorCd),
                    PetInfoRow(label: '나이', value: _currentItem!.age),
                    PetInfoRow(label: '체중', value: _currentItem!.weight),
                  ],
                ),

                // 보호 정보
                PetInfoCard(
                  title: '보호 정보',
                  children: [
                    PetInfoRow(label: '보호소명', value: _currentItem!.careNm),
                    PetInfoRow(label: '보호소 주소', value: _currentItem!.careAddr),
                    PetInfoRow(label: '보호소 전화', value: _currentItem!.careTel),
                    PetInfoRow(
                      label: '보호 시작일',
                      value: _currentItem!.noticeSdt != null
                          ? _formatDate(_currentItem!.noticeSdt!)
                          : null,
                    ),
                    PetInfoRow(
                      label: '보호 종료일',
                      value: _currentItem!.noticeEdt != null
                          ? _formatDate(_currentItem!.noticeEdt!)
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
                      value: _currentItem!.noticeNo != null
                          ? _formatDate(_currentItem!.noticeNo!)
                          : null,
                    ),
                    PetInfoRow(label: '관할기관', value: _currentItem!.orgNm),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
      bottomNavigationBar: _BottomButtons(item: _currentItem!),
    );
  }
}

class _BottomButtons extends StatefulWidget {
  final AbandonmentItem item;
  const _BottomButtons({required this.item});

  @override
  State<_BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<_BottomButtons> {
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
      _isFavorite = favorites.contains(widget.item.desertionNo ?? '');
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorite_pets') ?? [];
    final desertionNo = widget.item.desertionNo ?? '';

    setState(() {
      if (_isFavorite) {
        favorites.remove(desertionNo);
        _isFavorite = false;
      } else {
        favorites.add(desertionNo);
        _isFavorite = true;
      }
      prefs.setStringList('favorite_pets', favorites);
    });
  }

  String _formatDate(String? date) {
    if (date == null || date.length != 8) return '';
    return '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';
  }

  void _sharePetInfo() {
    final petInfo =
        '''
🐾 구조동물 정보

📋 기본 정보
• 품종: ${widget.item.kindFullNm ?? widget.item.kindNm}
• 공고번호: ${widget.item.noticeNo}
• 유기번호: ${widget.item.desertionNo}
• 상태: ${widget.item.processState}

📍 발견 정보
• 발견일: ${widget.item.happenDt != null ? _formatDate(widget.item.happenDt!) : '정보 없음'}
• 발견장소: ${widget.item.happenPlace ?? '정보 없음'}
• 특징: ${widget.item.specialMark ?? '정보 없음'}
• 색상: ${widget.item.colorCd ?? '정보 없음'}
• 나이: ${widget.item.age ?? '정보 없음'}
• 체중: ${widget.item.weight ?? '정보 없음'}

🏥 보호 정보
• 보호소명: ${widget.item.careNm ?? '정보 없음'}
• 보호소 주소: ${widget.item.careAddr ?? '정보 없음'}
• 보호소 전화: ${widget.item.careTel ?? '정보 없음'}
• 보호 시작일: ${widget.item.noticeSdt != null ? _formatDate(widget.item.noticeSdt!) : '정보 없음'}
• 보호 종료일: ${widget.item.noticeEdt != null ? _formatDate(widget.item.noticeEdt!) : '정보 없음'}

💝 유기동물 문의는 보호센터에 연락하시기 바랍니다!
''';

    Share.share(petInfo, subject: '구조동물 정보 공유');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 하트 아이콘 버튼 (관심 등록/해제)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _isFavorite ? AppColors.tossBlue : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isFavorite ? AppColors.tossBlue : AppColors.primary,
                  width: 2,
                ),
              ),
              child: IconButton(
                onPressed: _toggleFavorite,
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.white : AppColors.primary,
                  size: 24,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // 공유하기 버튼
            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _sharePetInfo,
                  icon: const Icon(Icons.share, size: 20),
                  label: const Text('공유하기'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
