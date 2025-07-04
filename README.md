# Paws for Home 🐾

국가동물보호정보시스템의 구조동물 정보를 조회하는 Flutter 앱입니다.  
농림축산식품부 농림축산검역본부_국가동물보호정보시스템 구조동물 조회 서비스를 데이터로 사용하며, 어떠한 사용자 정보도 수집하지 않습니다.

## ✨ 주요 기능

### 🏠 메인 기능
- **구조동물 목록 조회**: 전국 보호소의 구조동물 정보를 실시간으로 조회
- **상세 정보 표시**: 동물의 품종, 발견장소, 보호소, 연락처 등 상세 정보 제공
- **이미지 갤러리**: 동물의 여러 사진을 스와이프로 확인 가능
- **지도 연동**: 네이버, 카카오, 구글 지도로 보호소 위치 확인

### 🔍 검색 및 필터링
- **지역별 검색**: 시도/시군구별 구조동물 검색
- **축종별 필터링**: 개, 고양이, 기타 동물별 분류
- **상태별 필터링**: 공고중, 보호중 상태별 구분
- **검색 조건 저장**: 사용자가 설정한 검색 조건 자동 저장

### 💖 관심 동물 관리
- **관심 등록**: 마음에 드는 동물을 관심 목록에 추가
- **관심 목록**: 등록한 동물들을 한 곳에서 관리
- **자동 동기화**: 관심 등록 상태가 앱 전체에서 동기화

### 🎨 사용자 인터페이스
- **Toss 스타일 디자인**: 모던하고 깔끔한 UI/UX
- **다양한 보기 모드**: 리스트 보기와 그리드 보기 전환
- **스와이프 네비게이션**: 펫 상세 화면에서 스와이프로 뒤로가기
- **로딩 인디케이터**: 일관된 스타일의 로딩 애니메이션

### ⚙️ 설정 및 관리
- **설정 화면**: 앱 정보, 라이선스, 문의하기, 데이터 초기화
- **앱 데이터 관리**: SharedPreferences를 통한 설정 및 관심 목록 저장
- **문의 기능**: 이메일 앱 연동으로 직접 문의 가능

## 🛠 기술 스택

### 프레임워크 & 상태관리
- **Flutter**: 크로스 플랫폼 모바일 앱 개발
- **Riverpod**: 상태 관리 및 의존성 주입
- **Go Router**: 네비게이션 및 라우팅

### 네트워킹 & 데이터
- **Dio**: HTTP 클라이언트
- **Freezed**: 불변 데이터 모델 생성
- **JSON Serialization**: JSON 데이터 직렬화/역직렬화

### UI & UX
- **Cached Network Image**: 이미지 캐싱 및 로딩
- **Flutter Staggered Grid View**: 그리드 레이아웃
- **Swipeable Page Route**: 스와이프 네비게이션
- **Icons Flutter**: Material Community Icons

### 저장소 & 유틸리티
- **Shared Preferences**: 로컬 데이터 저장
- **URL Launcher**: 외부 앱 연동 (이메일, 지도)
- **Logger**: 디버깅 및 로깅

## 📱 API 정보

국가동물보호정보시스템의 공공데이터 API를 사용합니다.

### 주요 엔드포인트
- **구조동물 조회**: `/abandonmentPublic_v2`
- **시도 정보**: `/sido`
- **시군구 정보**: `/sigungu`
- **보호소 정보**: `/shelter`
- **축종 정보**: `/kind`

### 주요 파라미터
- `serviceKey`: 공공데이터포털 인증키
- `upkind`: 축종코드 (개: 417000, 고양이: 422400, 기타: 429900)
- `upr_cd`: 시도코드
- `org_cd`: 시군구코드
- `state`: 상태 (공고중: notice, 보호중: protect)
- `pageNo`: 페이지 번호
- `numOfRows`: 페이지당 보여줄 개수

## 📁 프로젝트 구조

```
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart          # 앱 색상 상수
│   ├── errors/                      # 에러 처리
│   ├── services/
│   │   ├── abandonment_api_service.dart  # API 서비스
│   │   └── preload_provider.dart    # 초기 데이터 로딩
│   └── utils/                       # 유틸리티 함수
├── features/
│   ├── pets/                        # 펫 관련 기능
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── pet_remote_data_source.dart
│   │   │   ├── models/              # 데이터 모델
│   │   │   └── repositories/
│   │   │       └── pet_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── pet_search_filter.dart
│   │   │   ├── repositories/
│   │   │   │   └── pet_repository.dart
│   │   │   └── usecases/
│   │   │       └── get_pets_usecase.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   ├── pet_providers.dart
│   │       │   └── search_filter_provider.dart
│   │       └── screens/
│   │           ├── pet_detail/       # 펫 상세 화면
│   │           │   ├── pet_detail_screen.dart
│   │           │   └── widgets/
│   │           │       ├── pet_image_gallery.dart
│   │           │       └── pet_info_card.dart
│   │           ├── pets_list/        # 펫 목록 화면
│   │           │   ├── pets_list_screen.dart
│   │           │   ├── favorite_pets_screen.dart
│   │           │   └── widgets/
│   │           │       ├── pet_card.dart
│   │           │       ├── pet_list_item.dart
│   │           │       ├── kind_selector.dart
│   │           │       ├── sido_selector.dart
│   │           │       └── search_conditions.dart
│   │           └── search_filter/    # 검색 필터 화면
│   │               ├── search_filter_screen.dart
│   │               └── widgets/
│   │                   └── filter_dropdown.dart
│   ├── settings/                     # 설정 화면
│   │   └── settings_screen.dart
│   └── splash/                       # 스플래시 화면
│       └── splash_screen.dart
├── shared/
│   └── models/                       # 공유 데이터 모델
│       ├── abandonment_response.dart
│       ├── kind_response.dart
│       ├── shelter_response.dart
│       ├── sido_response.dart
│       └── sigungu_response.dart
└── main.dart                         # 앱 진입점
```

## 🚀 설치 및 실행

### 필수 요구사항
- Flutter SDK: ^3.8.1
- Dart SDK: ^3.8.1
- Android Studio / VS Code
- 공공데이터포털 API 키

## 🎯 주요 화면

### 📋 펫 목록 화면
- 그리드/리스트 보기 전환
- 시도/축종별 필터링
- 무한 스크롤
- 관심 동물 등록

### 🔍 검색 필터 화면
- 지역별 검색
- 축종별 필터링
- 검색 조건 저장

### 📖 펫 상세 화면
- 동물 상세 정보
- 이미지 갤러리
- 보호소 정보
- 지도 연동
- 관심 등록/해제

### 💖 관심 동물 화면
- 등록된 관심 동물 목록
- 실시간 데이터 동기화

### ⚙️ 설정 화면
- 앱 정보 및 데이터 소스 안내
- 라이선스 정보
- 문의하기
- 앱 데이터 초기화

## 🔧 개발 환경 설정

### 권장 IDE 설정
- **VS Code**: Flutter 및 Dart 확장 프로그램 설치
- **Android Studio**: Flutter 플러그인 설치

### 디버깅
```bash
# 디버그 모드로 실행
flutter run --debug

# 릴리즈 모드로 실행
flutter run --release
```

## 📞 문의

- **이메일**: idlepoe@gmail.com
- **프로젝트**: [GitHub Repository](https://github.com/your-username/paws_for_home)

---

**Paws for Home**은 구조동물들이 새로운 가족을 찾을 수 있도록 도와주는 앱입니다. 🏠🐕🐱