// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:only_tempo/lib/features/viewmodel/theme_provider.dart';
import 'package:only_tempo/core/theme/theme.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'package:only_tempo/lib/features/view/pages/home_screen.dart';

class ScreenSize {
  static late double width;
  static late double height;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;
  }
}

void main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  final container = ProviderContainer();
  runApp(
    UncontrolledProviderScope(
      container: container, // 직접 생성한 ProviderContainer 전달
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider); // 현재 테마 감지

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme, // 테마 적용
      home: HomeScreen(),
    );
  }
}
