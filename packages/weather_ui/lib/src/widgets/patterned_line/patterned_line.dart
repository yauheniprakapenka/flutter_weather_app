import 'package:flutter/material.dart';

import 'pattern_widget.dart';
import 'pattern_widget_config.dart';
import 'pattern_widget_manager.dart';

class PatternedLine extends StatelessWidget {
  const PatternedLine({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final manager = PatternWidgetManager();
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: PatternWidgetConfig.heightSize,
      child: ColoredBox(
        color: Colors.grey[400] ?? Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              manager.getColorLength(),
              (segmentIndex) {
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        manager.getPatternLengthOnOneSegment(screenWidth),
                        (_) {
                          return PatternWidget(color: manager.getColor(segmentIndex));
                        },
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}