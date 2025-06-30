// 검색 조건 모델
class PetSearchFilter {
  final String? bgnde;
  final String? endde;
  final String? upkind;
  final String? kind;
  final String? uprCd;
  final String? orgCd;
  final String? careRegNo;
  final String? state;
  final String? neuterYn;
  final String? sexCd;
  final String? rfidCd;
  final String? desertionNo;
  final String? noticeNo;

  const PetSearchFilter({
    this.bgnde,
    this.endde,
    this.upkind,
    this.kind,
    this.uprCd,
    this.orgCd,
    this.careRegNo,
    this.state,
    this.neuterYn,
    this.sexCd,
    this.rfidCd,
    this.desertionNo,
    this.noticeNo,
  });

  PetSearchFilter copyWith({
    String? bgnde,
    String? endde,
    String? upkind,
    String? kind,
    String? uprCd,
    String? orgCd,
    String? careRegNo,
    String? state,
    String? neuterYn,
    String? sexCd,
    String? rfidCd,
    String? desertionNo,
    String? noticeNo,
  }) {
    return PetSearchFilter(
      bgnde: bgnde ?? this.bgnde,
      endde: endde ?? this.endde,
      upkind: upkind ?? this.upkind,
      kind: kind ?? this.kind,
      uprCd: uprCd ?? this.uprCd,
      orgCd: orgCd ?? this.orgCd,
      careRegNo: careRegNo ?? this.careRegNo,
      state: state ?? this.state,
      neuterYn: neuterYn ?? this.neuterYn,
      sexCd: sexCd ?? this.sexCd,
      rfidCd: rfidCd ?? this.rfidCd,
      desertionNo: desertionNo ?? this.desertionNo,
      noticeNo: noticeNo ?? this.noticeNo,
    );
  }

  bool get isEmpty =>
      bgnde == null &&
      endde == null &&
      upkind == null &&
      kind == null &&
      uprCd == null &&
      orgCd == null &&
      careRegNo == null &&
      state == null &&
      neuterYn == null &&
      sexCd == null &&
      rfidCd == null &&
      desertionNo == null &&
      noticeNo == null;

  Map<String, String?> toQuery() => {
    'bgnde': bgnde,
    'endde': endde,
    'upkind': upkind,
    'kind': kind,
    'upr_cd': uprCd,
    'org_cd': orgCd,
    'care_reg_no': careRegNo,
    'state': state,
    'neuter_yn': neuterYn,
    'sex_cd': sexCd,
    'rfid_cd': rfidCd,
    'desertion_no': desertionNo,
    'notice_no': noticeNo,
  }..removeWhere((key, value) => value == null || value.isEmpty);

  @override
  String toString() {
    final conditions = <String>[];

    // 축종
    if (upkind != null) {
      final upkindName = _getUpkindName(upkind!);
      conditions.add('축종: $upkindName');
    }

    // 시도
    if (uprCd != null) {
      conditions.add('시도: $uprCd');
    }

    // 시군구
    if (orgCd != null) {
      conditions.add('시군구: $orgCd');
    }

    // 보호소
    if (careRegNo != null) {
      conditions.add('보호소: $careRegNo');
    }

    // 품종
    if (kind != null) {
      conditions.add('품종: $kind');
    }

    // 상태
    if (state != null) {
      final stateName = _getStateName(state!);
      conditions.add('상태: $stateName');
    }

    // 중성화
    if (neuterYn != null) {
      final neuterName = _getNeuterName(neuterYn!);
      conditions.add('중성화: $neuterName');
    }

    // 성별
    if (sexCd != null) {
      final sexName = _getSexName(sexCd!);
      conditions.add('성별: $sexName');
    }

    // 구조일자
    if (bgnde != null && endde != null) {
      conditions.add('구조일자: $bgnde ~ $endde');
    }

    // 기타 텍스트 필드들
    if (rfidCd != null && rfidCd!.isNotEmpty) conditions.add('RFID: $rfidCd');
    if (desertionNo != null && desertionNo!.isNotEmpty)
      conditions.add('유기번호: $desertionNo');
    if (noticeNo != null && noticeNo!.isNotEmpty)
      conditions.add('공고번호: $noticeNo');

    return conditions.isEmpty ? '전체' : conditions.join(', ');
  }

  String _getUpkindName(String code) {
    switch (code) {
      case '417000':
        return '개';
      case '422400':
        return '고양이';
      case '429900':
        return '기타';
      default:
        return code;
    }
  }

  String _getStateName(String code) {
    switch (code) {
      case 'notice':
        return '공고중';
      case 'protect':
        return '보호중';
      case '공고중':
        return '공고중';
      case '보호중':
        return '보호중';
      case '종료(반환)':
        return '종료(반환)';
      default:
        return code;
    }
  }

  String _getNeuterName(String code) {
    switch (code) {
      case 'Y':
        return '예';
      case 'N':
        return '아니오';
      case 'U':
        return '미상';
      default:
        return code;
    }
  }

  String _getSexName(String code) {
    switch (code) {
      case 'M':
        return '수컷';
      case 'F':
        return '암컷';
      case 'Q':
        return '미상';
      default:
        return code;
    }
  }
}
