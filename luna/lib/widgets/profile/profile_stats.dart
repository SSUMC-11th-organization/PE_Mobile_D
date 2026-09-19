import 'package:flutter/material.dart';

import 'stat_item.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    required this.watchedCount,
    required this.averageRating,
    required this.favoriteCount,
  });

  final String watchedCount;
  final String averageRating;
  final String favoriteCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 주축(가로) 배치
      crossAxisAlignment: CrossAxisAlignment.start, // 교차축(세로) 위쪽 기준
      children: [
        // Expanded: 남은 가로 공간을 카드 3개가 똑같이 나눠 가짐
        Expanded(child: StatItem(label: '본 영화', value: watchedCount)),
        const SizedBox(width: 8),
        Expanded(child: StatItem(label: '평점', value: averageRating)),
        const SizedBox(width: 8),
        Expanded(child: StatItem(label: '즐겨찾기', value: favoriteCount)),
      ],
    );
  }
}
