import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paws_for_home/features/pets/presentation/pets_list_screen.dart';
import 'package:paws_for_home/core/services/abandonment_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef JsonMap = Map<String, dynamic>;

final preloadProvider = Provider<Future<void>>((ref) async {
  final api = AbandonmentApiService();
  final prefs = await SharedPreferences.getInstance();

  try {
    // 시도 리스트
    print('🔄 시도 리스트 로딩 중...');
    final sido = await api.getSidoList();
    await prefs.setString('sido', sido.toString());
    print('✅ 시도 리스트 저장 완료');

    // 첫 번째 시도 코드로 시군구 리스트
    final sidoItems = sido['body']?['items']?['item'];
    String? uprCd;
    if (sidoItems != null) {
      if (sidoItems is List && sidoItems.isNotEmpty) {
        // 서울특별시(6110000)를 기본값으로 사용
        uprCd = '6110000';
        // 만약 서울특별시가 없다면 첫 번째 항목 사용
        if (!sidoItems.any((item) => item['orgCd'] == '6110000')) {
          uprCd = sidoItems.first['orgCd'];
        }
      } else if (sidoItems is Map<String, dynamic>) {
        uprCd = sidoItems['orgCd'];
      }
    }

    if (uprCd != null) {
      print('🔄 시군구 리스트 로딩 중... (시도코드: $uprCd)');
      try {
        final sigungu = await api.getSigunguList(uprCd: uprCd);
        await prefs.setString('sigungu', sigungu.toString());
        print('✅ 시군구 리스트 저장 완료');

        // 첫 번째 시군구 코드로 보호소 리스트
        final sigunguItems = sigungu['body']?['items']?['item'];
        String? orgCd;
        if (sigunguItems != null) {
          if (sigunguItems is List && sigunguItems.isNotEmpty) {
            // 강남구(11680)를 기본값으로 사용
            orgCd = '11680';
            // 만약 강남구가 없다면 첫 번째 항목 사용
            if (!sigunguItems.any((item) => item['orgCd'] == '11680')) {
              orgCd = sigunguItems.first['orgCd'];
            }
          } else if (sigunguItems is Map<String, dynamic>) {
            orgCd = sigunguItems['orgCd'];
          }
        }

        if (orgCd != null) {
          print('🔄 보호소 리스트 로딩 중... (시도코드: $uprCd, 시군구코드: $orgCd)');
          try {
            final shelter = await api.getShelterList(
              uprCd: uprCd,
              orgCd: orgCd,
            );
            await prefs.setString('shelter', shelter.toString());
            print('✅ 보호소 리스트 저장 완료');
          } catch (e) {
            print('❌ 보호소 리스트 로딩 실패: $e');
          }
        }
      } catch (e) {
        print('❌ 시군구 리스트 로딩 실패: $e');
      }
    }

    // 품종 리스트 (개: 417000)
    print('🔄 품종 리스트 로딩 중... (축종코드: 417000)');
    final kind = await api.getKindList(upKindCd: '417000');
    await prefs.setString('kind', kind.toString());
    print('✅ 품종 리스트 저장 완료');

    print('🎉 모든 데이터 프리로드 완료!');
  } catch (e) {
    print('❌ 데이터 프리로드 중 오류 발생: $e');
    // 오류가 발생해도 앱은 계속 실행
  }
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 앱 시작 시 데이터 프리로드
  final container = ProviderContainer();
  await container.read(preloadProvider);
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paws for Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF7A00), // 따뜻한 주황
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF7F0),
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF7F0),
          foregroundColor: Color(0xFFFF7A00),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFFFF7A00),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
          bodyLarge: TextStyle(color: Color(0xFF444444)),
          bodySmall: TextStyle(color: Color(0xFF888888)),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF7A00),
          foregroundColor: Colors.white,
        ),
      ),
      home: const PetsListScreen(),
    );
  }
}
