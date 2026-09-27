import 'package:flutter/material.dart';

import '../widgets/common/app_svg_icon.dart';
import '../widgets/common/movie_log_app_bar.dart';
import '../widgets/sign_up/login_prompt.dart';
import '../widgets/sign_up/sign_up_submit_button.dart';
import '../widgets/sign_up/sign_up_welcome_text.dart';
import '../widgets/sign_up/terms_agreement_checkbox.dart';

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
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _agreedToTerms = false;

  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  void dispose() {
    // 더 이상 쓰지 않는 Controller와 FocusNode 정리
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
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

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) {
      return '이메일을 입력해주세요.';
    }
    if (!_emailPattern.hasMatch(email)) {
      return '올바른 이메일 형식이 아닙니다.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final password = value ?? '';

    if (password.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (password.length < 8) {
      return '비밀번호는 8자 이상이어야 합니다.';
    }
    return null;
  }

  // 모든 입력이 유효하고 약관에 동의했을 때만 버튼 활성화
  bool get _canSubmit =>
      _validateNickname(_nicknameController.text) == null &&
      _validateEmail(_emailController.text) == null &&
      _validatePassword(_passwordController.text) == null &&
      _agreedToTerms;

  void _submit() {
    // 버튼 활성화 조건과 별개로, 제출 시 Form 전체를 다시 검증
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('회원가입이 완료되었습니다.')));
  }

  // 입력값이 있을 때만 오른쪽에 오류(!) 또는 완료(✓) 아이콘 표시
  Widget? _statusIcon(String text, String? Function(String?) validator) {
    if (text.isEmpty) return null;

    final colorScheme = Theme.of(context).colorScheme;
    final hasError = validator(text) != null;

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: hasError
          ? AppSvgIcon('assets/icons/error.svg', color: colorScheme.error)
          : AppSvgIcon(
              'assets/icons/check_circle.svg',
              color: colorScheme.primary,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyLarge
        ?.copyWith(fontWeight: FontWeight.w600);

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
            // 사용자가 입력을 시작한 뒤부터 입력할 때마다 검증
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SignUpWelcomeText(),
                const SizedBox(height: 48),
                Text('닉네임', style: labelStyle),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nicknameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: '닉네임을 입력해주세요',
                    suffixIcon: _statusIcon(
                      _nicknameController.text,
                      _validateNickname,
                    ),
                  ),
                  validator: _validateNickname,
                  // 입력값에 따라 아이콘과 버튼 활성화도 다시 그리기 위해 setState
                  onChanged: (_) => setState(() {}),
                  onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
                ),
                const SizedBox(height: 16),
                Text('이메일', style: labelStyle),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: '이메일 주소를 입력해주세요',
                    suffixIcon: _statusIcon(
                      _emailController.text,
                      _validateEmail,
                    ),
                  ),
                  validator: _validateEmail,
                  onChanged: (_) => setState(() {}),
                  onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
                ),
                const SizedBox(height: 16),
                Text('비밀번호', style: labelStyle),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  // 마지막 입력창이므로 완료 버튼을 누르면 키보드가 닫힘
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력해주세요',
                    suffixIcon: _statusIcon(
                      _passwordController.text,
                      _validatePassword,
                    ),
                  ),
                  validator: _validatePassword,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 48),
                TermsAgreementCheckbox(
                  value: _agreedToTerms,
                  onChanged: (value) => setState(() => _agreedToTerms = value),
                ),
                const SizedBox(height: 16),
                SignUpSubmitButton(onPressed: _canSubmit ? _submit : null),
                const SizedBox(height: 32),
                const LoginPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
