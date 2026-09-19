import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // 화면의 안전 영역을 고려하여 UI를 배치
        child: Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 24), // 좌우 여백을 24로 설정
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ // UI 요소들을 세로로 배치
              const Icon(
                Icons.movie_outlined,
                size: 80,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 24),
              const Text(
                '영화의 순간을 기록하세요',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                '보고 싶은 영화부터 나만의 평점까지 한곳에서 관리해요',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 250),
              ElevatedButton(
                onPressed: () {
                  debugPrint('시작하기 버튼을 눌렀습니다.'); // 버튼 클릭 시 콘솔에 로그 출력
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,  
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                child: const Text('시작하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}