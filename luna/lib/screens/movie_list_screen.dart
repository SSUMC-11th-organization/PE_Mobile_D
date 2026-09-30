import 'package:flutter/material.dart';

import '../data/mock_movies.dart';
import '../widgets/common/movie_log_app_bar.dart';
import '../widgets/movie/movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MovieLogAppBar(title: '영화'),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 한 줄에 영화 카드 2개
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
            childAspectRatio: 0.55, // 포스터(2:3) + 제목·연도 텍스트 높이
          ),
          itemBuilder: (context, index) {
            return MovieCard(movie: movies[index]);
          },
        ),
      ),
    );
  }
}
