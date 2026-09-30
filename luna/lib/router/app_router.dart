import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/movie_detail_screen.dart';
import '../screens/movie_list_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/start_screen.dart';

/// 앱 전체에서 사용하는 Route를 한곳에서 관리한다.
/// 새 화면이 생기면 MaterialApp이 아니라 여기 routes에 GoRoute를 추가한다.
class AppRouter {
  AppRouter._(); // 외부에서 객체를 만들지 못하도록 막는 private 생성자

  // 앱 전체에서 라우터 하나만 쓰도록 static final로 선언
  static final router = GoRouter(
    // Guided Practice에서는 홈 → 상세 흐름을 바로 확인하도록 홈에서 시작
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/start',
        builder: (context, state) => const StartScreen(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/movies',
        builder: (context, state) => const MovieListScreen(),
        routes: [
          // /movies/:movieId — 영화 ID를 Path Parameter로 받음
          GoRoute(
            path: ':movieId',
            builder: (context, state) => MovieDetailScreen(
              movieId: state.pathParameters['movieId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/my',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
