import 'package:flutter/material.dart';

import '../data/mock_movies.dart';
import '../widgets/common/app_svg_icon.dart';
import '../widgets/common/movie_log_app_bar.dart';
import '../widgets/movie/movie_card.dart';
import '../widgets/movie_list/genre_chip_bar.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  String? _selectedGenre; // null이면 전체

  @override
  Widget build(BuildContext context) {
    final filteredMovies = filterMoviesByGenre(_selectedGenre);

    return Scaffold(
      appBar: MovieLogAppBar(
        title: '영화',
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
        child: Column(
          children: [
            const SizedBox(height: 8),
            GenreChipBar(
              genres: genres,
              selectedGenre: _selectedGenre,
              onSelected: (genre) => setState(() => _selectedGenre = genre),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredMovies.isEmpty
                  ? Center(
                      child: Text(
                        '$_selectedGenre 장르의 영화가 없어요.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                      itemCount: filteredMovies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 한 줄에 영화 카드 2개
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                            childAspectRatio: 0.55, // 포스터(2:3) + 제목·연도 텍스트
                          ),
                      itemBuilder: (context, index) {
                        return MovieCard(movie: filteredMovies[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
