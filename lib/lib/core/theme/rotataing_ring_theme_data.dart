import 'dart:ui';

import 'package:flutter/material.dart';

class RotatingRingThemeData extends ThemeExtension<RotatingRingThemeData> {
  final Color ringColor;
  final double ringThickness;

  const RotatingRingThemeData({
    required this.ringColor,
    required this.ringThickness,
  });

  @override
  RotatingRingThemeData copyWith({
    Color? ringColor,
    double? ringThickness,
  }) {
    return RotatingRingThemeData(
      ringColor: ringColor ?? this.ringColor,
      ringThickness: ringThickness ?? this.ringThickness,
    );
  }

  @override
  RotatingRingThemeData lerp(
      ThemeExtension<RotatingRingThemeData>? other, double t) {
    if (other is! RotatingRingThemeData) {
      return this;
    }
    return RotatingRingThemeData(
      ringColor: Color.lerp(ringColor, other.ringColor, t) ?? ringColor,
      ringThickness:
          lerpDouble(ringThickness, other.ringThickness, t) ?? ringThickness,
    );
  }
}
