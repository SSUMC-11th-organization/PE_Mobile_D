import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 홈·영화·마이 탭이 공유하는 NavigationBar 레이아웃.
/// body에는 ShellRoute가 전달한 현재 탭 화면(child)만 바뀌어 표시된다.
class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.currentIndex,
    required this.child,
  });

  final int currentIndex; // 현재 URL에서 계산한 선택 탭
  final Widget child;

  static const _tabPaths = ['/home', '/movies', '/my'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        // 탭 전환은 화면을 쌓지 않고 현재 위치 자체를 바꾸므로 go 사용
        onDestinationSelected: (index) => context.go(_tabPaths[index]),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            selectedIcon: Icon(Icons.movie),
            label: '영화',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: '마이',
          ),
        ],
      ),
    );
  }
}
