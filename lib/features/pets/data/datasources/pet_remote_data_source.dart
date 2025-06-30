import 'package:paws_for_home/core/services/abandonment_api_service.dart';

abstract class PetRemoteDataSource {
  Future<Map<String, dynamic>> getAbandonmentData({
    required String numOfRows,
    required String pageNo,
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
  });
}

class PetRemoteDataSourceImpl implements PetRemoteDataSource {
  final AbandonmentApiService apiService;

  PetRemoteDataSourceImpl(this.apiService);

  @override
  Future<Map<String, dynamic>> getAbandonmentData({
    required String numOfRows,
    required String pageNo,
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
  }) async {
    return await apiService.getAbandonmentData(
      numOfRows: numOfRows,
      pageNo: pageNo,
      bgnde: bgnde,
      endde: endde,
      upkind: upkind,
      kind: kind,
      uprCd: uprCd,
      orgCd: orgCd,
      careRegNo: careRegNo,
      state: state,
      neuterYn: neuterYn,
      sexCd: sexCd,
      rfidCd: rfidCd,
      desertionNo: desertionNo,
      noticeNo: noticeNo,
    );
  }
}
