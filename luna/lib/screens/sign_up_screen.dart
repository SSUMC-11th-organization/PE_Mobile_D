import 'package:flutter/material.dart';

import '../widgets/common/movie_log_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Form 전체의 상태(validate 등)에 접근하기 위한 key
  final _formKey = GlobalKey<FormState>();

  // 화면이 살아 있는 동안 유지해야 하므로 build가 아닌 State의 필드로 선언
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  // ignore: unused_field, prefer_final_fields — Required Mission의 약관 Checkbox에서 사용
  bool _agreedToTerms = false;

  @override
  void dispose() {
    // 더 이상 쓰지 않는 Controller와 FocusNode 정리
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  String? _validateNickname(String? value) {
    final nickname = value?.trim() ?? '';

    if (nickname.isEmpty) {
      return '닉네임을 입력해주세요.';
    }
    if (nickname.length < 2) {
      return '닉네임은 2자 이상이어야 합니다.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: const MovieLogAppBar(
        title: '회원가입',
        showBackButton: true,
        centerTitle: true,
      ),
      body: SafeArea(
        // 입력 항목이 화면보다 길어지거나 키보드가 올라와도 스크롤로 접근 가능
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '환영합니다!\n간단한 정보만 입력하고 시작해보세요.',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                Text('닉네임', style: textTheme.labelLarge),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nicknameController,
                  // 사용자가 한 번 입력을 시작한 뒤부터 입력할 때마다 검증
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: '닉네임을 입력해주세요',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateNickname,
                  // 입력값에 따라 다른 UI(버튼 활성화 등)도 다시 그리기 위해 setState
                  onChanged: (_) => setState(() {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
