import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AbandonmentApiService {
  static const String _serviceKey =
      'CuG%2BvU5zh0nO4kA%2B7PgTYNCTGfpQMPDyRspk7UE2HeErYZe7jmrtaQtZMtKnPEm2aBQIS2hnRXoAgwZPT2X0uQ%3D%3D';
  static const String _baseUrl =
      'https://apis.data.go.kr/1543061/abandonmentPublicService_v2';
  final Logger _logger = Logger();

  late final Dio _dio;

  AbandonmentApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'accept': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logRequest(options);
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logResponse(response);
          handler.next(response);
        },
        onError: (error, handler) {
          _logError(error);
          handler.next(error);
        },
      ),
    );
  }

  void _logRequest(RequestOptions options) {
    _logger.i(
      '🚀 API REQUEST\nURI: ${options.uri}\nMethod: ${options.method}\nParams: ${options.queryParameters}',
    );
  }

  void _logResponse(Response response) {
    final logMsg = [
      '✅ API RESPONSE',
      'URI: ${response.requestOptions.uri}',
      'Params: ${response.requestOptions.queryParameters}',
      'Status Code: ${response.statusCode}',
      'Data: ${response.data}',
    ].join('\n');
    _logger.i(logMsg);
  }

  void _logError(DioException error) {
    _logger.e(
      '❌ API ERROR\nURI: ${error.requestOptions.uri}\nStatus Code: ${error.response?.statusCode}\nMessage: ${error.message}\nData: ${error.response?.data}',
    );
  }

  Future<Map<String, dynamic>> getAbandonmentData({
    String? bgnde,
    String? endde,
    String? upkind,
    String? kind,
    String? uprCd,
    String? orgCd,
    String? careRegNo,
    String? state,
    String? neuterYn,
    String? pageNo = '1',
    String? numOfRows = '10',
    String? bgupd,
    String? enupd,
    String? sexCd,
    String? rfidCd,
    String? desertionNo,
    String? noticeNo,
  }) async {
    try {
      // 필수 파라미터(serviceKey, _type=json)와 선택 파라미터만 추가
      final buffer = StringBuffer(
        '/abandonmentPublic_v2?serviceKey=$_serviceKey&_type=json',
      );
      if (pageNo != null) buffer.write('&pageNo=$pageNo');
      if (numOfRows != null) buffer.write('&numOfRows=$numOfRows');
      if (bgnde != null && bgnde.isNotEmpty) buffer.write('&bgnde=$bgnde');
      if (endde != null && endde.isNotEmpty) buffer.write('&endde=$endde');
      if (upkind != null && upkind.isNotEmpty) buffer.write('&upkind=$upkind');
      if (kind != null && kind.isNotEmpty) buffer.write('&kind=$kind');
      if (uprCd != null && uprCd.isNotEmpty) buffer.write('&upr_cd=$uprCd');
      if (orgCd != null && orgCd.isNotEmpty) buffer.write('&org_cd=$orgCd');
      if (careRegNo != null && careRegNo.isNotEmpty)
        buffer.write('&care_reg_no=$careRegNo');
      if (state != null && state.isNotEmpty) buffer.write('&state=$state');
      if (neuterYn != null && neuterYn.isNotEmpty)
        buffer.write('&neuter_yn=$neuterYn');
      if (bgupd != null && bgupd.isNotEmpty) buffer.write('&bgupd=$bgupd');
      if (enupd != null && enupd.isNotEmpty) buffer.write('&enupd=$enupd');
      if (sexCd != null && sexCd.isNotEmpty) buffer.write('&sex_cd=$sexCd');
      if (rfidCd != null && rfidCd.isNotEmpty) buffer.write('&rfid_cd=$rfidCd');
      if (desertionNo != null && desertionNo.isNotEmpty)
        buffer.write('&desertion_no=$desertionNo');
      if (noticeNo != null && noticeNo.isNotEmpty)
        buffer.write('&notice_no=$noticeNo');

      final url = buffer.toString();
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('API 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('API 요청 중 오류 발생: $e');
    }
  }

  Future<Map<String, dynamic>> getSidoList({
    String? numOfRows,
    String? pageNo,
  }) async {
    try {
      final buffer = StringBuffer(
        '/sido_v2?serviceKey=$_serviceKey&_type=json',
      );
      if (numOfRows != null) buffer.write('&numOfRows=$numOfRows');
      if (pageNo != null) buffer.write('&pageNo=$pageNo');
      final url = buffer.toString();
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('시도 조회 API 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('시도 조회 API 요청 중 오류 발생: $e');
    }
  }

  Future<Map<String, dynamic>> getSigunguList({
    required String uprCd,
    String? numOfRows,
    String? pageNo,
  }) async {
    try {
      final buffer = StringBuffer(
        '/sigungu_v2?serviceKey=$_serviceKey&_type=json&upr_cd=$uprCd',
      );
      if (numOfRows != null) buffer.write('&numOfRows=$numOfRows');
      if (pageNo != null) buffer.write('&pageNo=$pageNo');
      final url = buffer.toString();
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('시군구 조회 API 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('시군구 조회 API 요청 중 오류 발생: $e');
    }
  }

  Future<Map<String, dynamic>> getShelterList({
    required String uprCd,
    required String orgCd,
    String? numOfRows,
    String? pageNo,
  }) async {
    try {
      final buffer = StringBuffer(
        '/shelter_v2?serviceKey=$_serviceKey&_type=json&upr_cd=$uprCd&org_cd=$orgCd',
      );
      if (numOfRows != null) buffer.write('&numOfRows=$numOfRows');
      if (pageNo != null) buffer.write('&pageNo=$pageNo');
      final url = buffer.toString();
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('보호소 조회 API 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('보호소 조회 API 요청 중 오류 발생: $e');
    }
  }

  Future<Map<String, dynamic>> getKindList({
    required String upKindCd,
    String? numOfRows,
    String? pageNo,
  }) async {
    try {
      final buffer = StringBuffer(
        '/kind_v2?serviceKey=$_serviceKey&_type=json&up_kind_cd=$upKindCd',
      );
      if (numOfRows != null) buffer.write('&numOfRows=$numOfRows');
      if (pageNo != null) buffer.write('&pageNo=$pageNo');
      final url = buffer.toString();
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('품종 조회 API 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('품종 조회 API 요청 중 오류 발생: $e');
    }
  }
}
