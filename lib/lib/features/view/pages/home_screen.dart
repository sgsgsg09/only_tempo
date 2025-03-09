import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:only_tempo/lib/features/models/tempo.dart';
import 'package:only_tempo/lib/features/viewmodel/tempo_provider.dart';
import 'package:only_tempo/lib/features/viewmodel/theme_provider.dart';
import 'package:only_tempo/lib/features/view/widgets/dail_widget.dart';
import 'package:only_tempo/lib/features/view/widgets/MetronomeUI.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier); // 테마 전환 컨트롤러
    final isDarkMode = ref.watch(themeProvider.notifier).isDarkMode; // 현재 모드 확인
    final tempoModel = ref.watch(tempoModelProvider);
    final groupNumber = tempoModel.groupNumber; // 현재 ID 가져오기

    return Scaffold(
      appBar: AppBar(
        title: Text('Metronome'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeNotifier.toggleTheme(); // 테마 전환
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: MetronomeUI(id: groupNumber)),
            Expanded(child: DialWidget(id: groupNumber)),
          ],
        ),
      ),
    );
  }
}
