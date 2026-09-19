import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 모든 화면에서 공통으로 쓰는 AppBar.
/// 색, 글꼴, 정렬은 AppTheme의 AppBarTheme을 따른다.
class MovieLogAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MovieLogAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
  });

  final String title;
  final bool showBackButton; // true면 왼쪽에 뒤로가기 버튼을 표시
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
                semanticsLabel: '뒤로가기',
              ),
            )
          : null,
      title: Text(title),
      actions: actions,
    );
  }
}
