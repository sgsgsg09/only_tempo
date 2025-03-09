// lib/data/providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:only_tempo/core/theme/theme.dart';

// StateNotifier를 사용한 테마 상태 관리
class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(AppTheme.lightTheme); // 초기값은 다크 테마

  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    state = _isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme;
  }
}

// Riverpod Provider 정의
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) => ThemeNotifier(),
);
