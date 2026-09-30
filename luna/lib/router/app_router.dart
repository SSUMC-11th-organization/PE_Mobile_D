import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/main_screen.dart';
import '../screens/movie_detail_screen.dart';
import '../screens/movie_list_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/start_screen.dart';

/// 앱 전체에서 사용하는 Route를 한곳에서 관리한다.
/// 새 화면이 생기면 MaterialApp이 아니라 여기 routes에 GoRoute를 추가한다.
class AppRouter {
  AppRouter._(); // 외부에서 객체를 만들지 못하도록 막는 private 생성자

  // 상세 화면을 NavigationBar 위(최상위 Navigator)에 띄우기 위한 key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  // 앱 전체에서 라우터 하나만 쓰도록 static final로 선언
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/start',
    routes: [
      GoRoute(path: '/start', builder: (context, state) => const StartScreen()),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      // 홈·영화·마이 탭은 MainScreen(NavigationBar) 안에서 child만 바뀜
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(
            currentIndex: indexFromLocation(state.uri.path),
            child: child,
          );
        },
        routes: [
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
                // NavigationBar 없이 전체 화면으로 표시
                parentNavigatorKey: _rootNavigatorKey,
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
      ),
    ],
  );

  /// 현재 경로로 NavigationBar에서 선택할 탭 index를 계산
  static int indexFromLocation(String path) {
    if (path.startsWith('/movies')) return 1;
    if (path.startsWith('/my')) return 2;
    return 0;
  }
}
