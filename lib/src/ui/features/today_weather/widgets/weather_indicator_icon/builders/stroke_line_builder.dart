import 'package:flutter/material.dart';

import '../config/weather_indicator_icon_config.dart';
import '../models/stroke_line_direction.dart';

class StrokeLineBuilder extends StatelessWidget {
  final StrokeLineDirection strokeLineDirection;

  const StrokeLineBuilder({
    Key? key,
    required this.strokeLineDirection,
  }) : super(key: key);

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidgetSize = _getAvailableSize(constraints);
        const lineLength = 4.0;
        final dashCount = (availableWidgetSize / (lineLength * 2)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: _getDirection(),
          children: List.generate(
            dashCount,
            (_) {
              return SizedBox.fromSize(
                size: _getBoxSize(WeatherIndicatorIconConfig.thicknessLine, lineLength),
                child: const DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFd5d4d5)),
                ),
              );
            },
          ),
        );
      },
    );
  }

  double _getAvailableSize(BoxConstraints boxConstraints) {
    return strokeLineDirection == StrokeLineDirection.horizontal
        ? boxConstraints.constrainWidth()
        : boxConstraints.constrainHeight();
  }

  Axis _getDirection() {
    return strokeLineDirection == StrokeLineDirection.horizontal ? Axis.horizontal : Axis.vertical;
  }

  Size _getBoxSize(double thicknessLine, double lineLength) {
    final width = strokeLineDirection == StrokeLineDirection.vertical ? thicknessLine : lineLength;
    final heigth = strokeLineDirection == StrokeLineDirection.vertical ? lineLength : thicknessLine;
    return Size(width, heigth);
  }
}
