import 'package:flutter/material.dart';

import '../data/mock_movies.dart';
import '../widgets/common/app_svg_icon.dart';
import '../widgets/common/movie_log_app_bar.dart';
import '../widgets/movie/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MovieLogAppBar(
        title: 'MovieLog',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const AppSvgIcon(
              'assets/icons/search.svg',
              semanticsLabel: '검색',
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '오늘은 어떤\n영화를 볼까요?',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              // Guided Practice: Mock Movie 한 건만 카드로 표시
              SizedBox(
                width: 160,
                height: 290,
                child: MovieCard(movie: movies.first),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
