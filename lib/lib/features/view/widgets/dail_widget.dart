import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:only_tempo/lib/core/providers/metronome_notifier.dart';
import 'dart:math';

import 'package:only_tempo/lib/features/viewmodel/tempo_provider.dart';

class DialWidget extends ConsumerStatefulWidget {
  final int id;

  DialWidget({required this.id}); // ID를 매개변수로 전달받음

  @override
  _DialWidgetState createState() => _DialWidgetState();
}

class _DialWidgetState extends ConsumerState<DialWidget> {
  double _rotationAngle = -pi / 2; // 초기값을 12시 방향으로 설정
  final double minAngle = -5 * pi / 4; // MIN 값 (7시 방향)
  final double maxAngle = 1 * pi / 4; // MAX 값 (5시 방향)
  bool _isRunning = true; // 메트로놈 실행 상태

  void _updateVolume(DragUpdateDetails details) {
    setState(() {
      _rotationAngle =
          _clampRotationAngle(_rotationAngle + details.delta.dx * 0.01);
    });

    final normalizedRotation =
        (_rotationAngle - minAngle) / (maxAngle - minAngle);
    final newVolume = (normalizedRotation * 100).clamp(0, 100).toInt();

    // 상태 업데이트
    ref.read(tempoModelProvider.notifier).updateVolume(widget.id, newVolume);
  }

  double _clampRotationAngle(double angle) {
    return angle.clamp(minAngle, maxAngle);
  }

  void _handleTap() {
    final audioPlayerNotifier = ref.read(metronomeNotifierProvider.notifier);

    setState(() {
      _isRunning = !_isRunning; // 실행 상태 토글
    });

    if (_isRunning) {
      audioPlayerNotifier.togglePlayPause(); // 재생
    } else {
      audioPlayerNotifier.togglePlayPause(); // 일시정지
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color backgroundColor = theme.scaffoldBackgroundColor;
    final TextStyle bodyLarge = theme.textTheme.bodyLarge!;

    // 현재 Volume 값 읽기
    final volume = ref
        .watch(tempoModelProvider)
        .elements
        .firstWhere((element) => element.id == widget.id)
        .volume;

    return GestureDetector(
      onPanUpdate: _updateVolume,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double dialSize = constraints.maxWidth * 0.8;
          final double buttonSize = dialSize * 0.8;

          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 다이얼 눈금
                CustomPaint(
                  size: Size(dialSize, dialSize),
                  painter:
                      DialPainter(_rotationAngle, minAngle, maxAngle, volume),
                ),
                // 중앙 버튼 (회전 효과 적용)
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 6,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: _handleTap,
                    child: Transform.rotate(
                      angle: _rotationAngle + pi / 2, // 텍스트도 다이얼 각도에 맞춰 회전
                      child: Container(
                        width: buttonSize,
                        height: buttonSize,
                        child: Center(
                          child: Text(
                            "tap",
                            style: bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DialPainter extends CustomPainter {
  final double rotationAngle;
  final double minAngle;
  final double maxAngle;
  final int volume;

  DialPainter(this.rotationAngle, this.minAngle, this.maxAngle, this.volume);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final int minIndex = 0; // MIN의 인덱스
    final int maxIndex = 100; // MAX의 인덱스
    final double volumeAngle =
        minAngle + (volume / 100) * (maxAngle - minAngle); // 볼륨 각도 계산
    for (int i = minIndex; i <= maxIndex; i++) {
      final double angle =
          minAngle + i * (maxAngle - minAngle) / maxIndex; // MIN에서 MAX까지 분할

      if (angle < minAngle || angle > maxAngle) {
        continue;
      }

      final double x1 = center.dx + radius * cos(angle);
      final double y1 = center.dy + radius * sin(angle);
      final double x2 = center.dx + (radius - 10) * cos(angle);
      final double y2 = center.dy + (radius - 10) * sin(angle);

      final double normalizedRotation =
          (rotationAngle - minAngle) / (maxAngle - minAngle);
      final int currentIndex =
          (normalizedRotation * maxIndex).clamp(minIndex, maxIndex).toInt();

      if ((angle - volumeAngle).abs() < 0.02) {
        paint.color = Colors.red;
        paint.strokeWidth = 4; // 빨간 눈금
      } else {
        paint.color = Colors.grey.withOpacity(0.5);
        paint.strokeWidth = 2;
      }

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }

    _drawText(canvas, 'MIN', center, radius, minAngle);
    _drawText(canvas, 'MAX', center, radius, maxAngle);
  }

  void _drawText(
      Canvas canvas, String text, Offset center, double radius, double angle) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final double textX =
        center.dx + (radius + 20) * cos(angle) - textPainter.width / 2;
    final double textY =
        center.dy + (radius + 20) * sin(angle) - textPainter.height / 2;

    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return (oldDelegate as DialPainter).rotationAngle != rotationAngle;
  }
}
