import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../theme/app_colors.dart';
import '../widgets/movie_card.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  static const _all = '전체';
  String _selectedGenre = _all;

  @override
  Widget build(BuildContext context) {
    final genres = [
      _all,
      ...{for (final movie in movies) movie.genre},
    ];
    final filtered = _selectedGenre == _all
        ? movies
        : movies.where((movie) => movie.genre == _selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('영화', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: genres.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final genre = genres[index];
                final isSelected = genre == _selectedGenre;
                return ChoiceChip(
                  label: Text(genre),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedGenre = genre),
                  selectedColor: AppColors.violet,
                  labelStyle: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: AppColors.lightGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide.none,
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: filtered.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return MovieCard(movie: filtered[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
