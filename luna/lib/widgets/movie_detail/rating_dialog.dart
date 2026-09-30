import 'package:flutter/material.dart';

import '../movie/movie_rating_input.dart';

/// 별점을 선택하는 커스텀 Dialog.
/// 확인을 누르면 선택한 별점을 Navigator.pop으로 돌려준다.
class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key, this.initialRating});

  final double? initialRating; // 이전에 남긴 평점이 있으면 그 값으로 시작

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late double _rating = widget.initialRating ?? 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          // Column이 Dialog 내용에 필요한 높이만 차지하도록 함
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '영화는 어떠셨나요?',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Center(
              child: MovieRatingInput(
                rating: _rating,
                onChanged: (value) => setState(() => _rating = value),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              // 별점을 선택하기 전(0점)에는 확인 버튼 비활성화
              onPressed: _rating > 0
                  ? () => Navigator.pop(context, _rating)
                  : null,
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
