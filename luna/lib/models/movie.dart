/// 홈·목록·상세 화면이 함께 쓰는 영화 데이터.
class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.year,
    required this.posterAsset,
  });

  final int id; // 상세 Route의 Path Parameter로 사용
  final String title;
  final String genre;
  final int year;
  final String posterAsset; // assets/images/posters/ 아래의 이미지
}
