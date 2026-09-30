import 'package:flutter/material.dart';

import '../data/mock_movies.dart';
import '../widgets/common/movie_log_app_bar.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movieId});

  // Path Parameter는 문자열로 전달되므로 그대로 받고, 화면에서 숫자로 변환
  final String movieId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    // Extra에 의존하지 않고 ID로 Mock Data를 다시 찾음 (URL 직접 접근에도 동작)
    final movie = findMovieById(int.tryParse(movieId));

    return Scaffold(
      appBar: const MovieLogAppBar(
        title: 'Cinema Archive',
        showBackButton: true,
        centerTitle: true,
      ),
      body: movie == null
          ? Center(
              child: Text('영화를 찾을 수 없어요.', style: textTheme.bodyLarge),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.asset(movie.posterAsset, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title, style: textTheme.headlineLarge),
                        const SizedBox(height: 4),
                        Text(
                          '${movie.year} • ${movie.genre}',
                          style: textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
