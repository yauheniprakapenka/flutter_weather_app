import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/ui/features/today_weather/widgets/patterned_line/config/patternt_widget_config.dart';

class PatternWidget extends StatelessWidget {
  final Color color;

  const PatternWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(context) {
    const _containerSize = PatternWidgetConfig.containerSize;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: _containerSize,
              height: _containerSize,
              color: color,
            ),
            Container(
              width: _containerSize,
              height: _containerSize,
              color: color,
            ),
            Container(
              width: _containerSize,
              height: _containerSize,
              color: Colors.transparent,
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: _containerSize,
              height: _containerSize,
              color: Colors.transparent,
            ),
            Container(
              width: _containerSize,
              height: _containerSize,
              color: color,
            ),
            Container(
              width: _containerSize,
              height: _containerSize,
              color: color,
            ),
          ],
        ),
      ],
    );
  }
}
