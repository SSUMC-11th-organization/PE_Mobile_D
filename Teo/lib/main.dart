import 'package:flutter/material.dart';

// 앱 실행 시작점
void main() {
  // 5. Dart 최소 문법 -------------------------

  // 변수와 타입
  final String appName = 'MovieLog';
  const int currentWeek = 0;
  var isReady = true;

  print(appName);
  print(currentWeek);
  print(isReady);

  // 함수 + Named Parameter
  print(greeting(name: 'Theo', week: 0));

  // List
  final genres = <String>['드라마', 'SF', '애니메이션'];

  print(genres);

  // Map
  final profile = <String, Object>{'nickname': '무비러버', 'week': 0};

  print(profile);

  // Null Safety
  String? nickname;
  print(displayName(nickname));

  /// Movie Class를 이용해 영화 3개를 List에 저장
  final movies = <Movie>[
    const Movie(id: 1, title: '인터스텔라'),
    const Movie(id: 2, title: '인셉션'),
    const Movie(id: 3, title: '기생충'),
  ];

  // for문을 사용해 영화 제목 출력
  for (final movie in movies) {
    print(movie.title);
  }

  // 7. Flutter 앱 실행
  runApp(const MovieLogApp());
}

// 함수 + Named Parameter
String greeting({required String name, int week = 0}) {
  return '$name님, Flutter $week주차를 시작합니다.';
}

// Null Safety
String displayName(String? nickname) {
  return nickname?.trim().isNotEmpty == true ? nickname! : '이름 없음';
}

// Class
class Movie {
  const Movie({required this.id, required this.title});

  final int id;
  final String title;
}

// 앱 전체 설정
class MovieLogApp extends StatelessWidget {
  const MovieLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieLog',
      theme: ThemeData(useMaterial3: true),
      home: const StartScreen(),
    );
  }
}

// 실제 화면
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // 화면 좌우 여백
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            // 세로 방향 가운데 정렬
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // MovieLog 기본 아이콘
              const Icon(
                Icons.movie_outlined,
                size: 72,
                color: Colors.deepPurple,
                semanticLabel: 'MovieLog 로고',
              ),

              // 아이콘과 제목 사이 간격
              const SizedBox(height: 24),

              // 메인 제목
              const Text(
                '영화의 순간을 기록하세요',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // 제목과 설명 사이 간격
              const SizedBox(height: 12),

              // 설명 문구
              const Text(
                '보고 싶은 영화부터 나만의 평점까지 한곳에서 관리해요',
                textAlign: TextAlign.center,
              ),

              // 설명과 버튼 사이 간격
              const SizedBox(height: 32),

              // 시작하기 버튼
              ElevatedButton(
                onPressed: () {
                  // 0주차에서는 화면 이동 없이 로그만 출력
                  debugPrint('시작하기 버튼을 눌렀습니다.');
                },

                style: ElevatedButton.styleFrom(
                  // 버튼을 가로로 넓게 설정
                  minimumSize: const Size(double.infinity, 48),

                  // 버튼 내부 좌우 여백
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
