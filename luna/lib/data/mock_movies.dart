import '../models/movie.dart';

/// 모든 화면이 같은 값을 읽도록 한곳에 모아 둔 Mock 영화 목록.
const movies = [
  Movie(
    id: 1,
    title: '별빛 아래 우리',
    genre: '드라마',
    year: 2024,
    posterAsset: 'assets/images/posters/hero_under_the_starlight.jpg',
  ),
  Movie(
    id: 2,
    title: '우주의 끝에서',
    genre: 'SF',
    year: 2024,
    posterAsset: 'assets/images/posters/poster_echoes_of_the_void.jpg',
  ),
  Movie(
    id: 3,
    title: '기억의 숲',
    genre: '애니메이션',
    year: 2022,
    posterAsset: 'assets/images/posters/poster_whispering_woods.jpg',
  ),
  Movie(
    id: 4,
    title: '밤의 그림자',
    genre: '스릴러',
    year: 2024,
    posterAsset: 'assets/images/posters/poster_night_shadows.jpg',
  ),
  Movie(
    id: 5,
    title: '봄날의 커피',
    genre: '로맨스',
    year: 2021,
    posterAsset: 'assets/images/posters/poster_fourth_afternoon.jpg',
  ),
  Movie(
    id: 6,
    title: '마션 레스큐',
    genre: 'SF',
    year: 2023,
    posterAsset: 'assets/images/posters/poster_abyss_walker.jpg',
  ),
];

/// Path Parameter로 받은 ID에 해당하는 영화를 찾는다. 없으면 null.
Movie? findMovieById(int? id) {
  for (final movie in movies) {
    if (movie.id == id) return movie;
  }
  return null;
}
