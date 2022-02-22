import 'package:flutter/material.dart';

import '../config/patternt_widget_config.dart';

class PatternManager {
  final _colors = [
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  Color getColor(int index) {
    return _colors[index];
  }

  int getColorLength() {
    return _colors.length;
  }

  int getPatternLengthOnOneSegment(double screenWidth) {
    final oneSegmentWidth = (screenWidth / getColorLength()).floor();
    const paddingBetweenPatterns = PatternWidgetConfig.paddingBetweenPatterns;
    const patternWithPadding = PatternWidgetConfig.widthSize + paddingBetweenPatterns;
    return (oneSegmentWidth / patternWithPadding).floor();
  }
}
