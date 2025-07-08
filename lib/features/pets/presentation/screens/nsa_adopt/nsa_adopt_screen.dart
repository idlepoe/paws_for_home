import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:paws_for_home/core/constants/app_colors.dart';

class NsaAdoptScreen extends StatefulWidget {
  const NsaAdoptScreen({super.key});

  @override
  State<NsaAdoptScreen> createState() => _NsaAdoptScreenState();
}

class _NsaAdoptScreenState extends State<NsaAdoptScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            // animals-list만 남기던 JS 코드 삭제됨
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://www.animal.go.kr/front/awtis/nsaAdopt/nsaAdoptList.do?totalCount=19&pageSize=20&menuNo=1000400000',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          '국가봉사동물 입양',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.tossBlue),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: AppColors.tossBlue),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Container(
              color: AppColors.background,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeCap: StrokeCap.round,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '국가봉사동물 입양 페이지를 불러오는 중...',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
