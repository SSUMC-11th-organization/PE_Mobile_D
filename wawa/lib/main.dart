import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screens/sign_up_screen.dart';

void main() {
  runApp(const MovieLogApp());
}

class MovieLogApp extends StatelessWidget {
  const MovieLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 오른쪽 위 디버그 띠 제거
      title: 'MovieLog',
      theme: AppTheme.light, // 공통 테마 적용
      home: const SignUpScreen(), // 시작 화면 설정
    );
  }
}
