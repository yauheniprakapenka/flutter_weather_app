import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/ui.dart';

import 'builders/stroke_line_builder.dart';
import 'models/stroke_line_direction.dart';
import 'widgets/empty_space.dart';

class WeatherIndicatorIcon extends StatelessWidget {
  final Widget icon;
  final String title;

  const WeatherIndicatorIcon({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 50,
          child: Column(
            children: [
              Row(
                children: const [
                  EmptySpace(),
                  Expanded(
                    child: StrokeLineBuilder(strokeLineDirection: StrokeLineDirection.horizontal),
                  ),
                  EmptySpace(),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    const StrokeLineBuilder(strokeLineDirection: StrokeLineDirection.vertical),
                    Expanded(
                      child: icon,
                    ),
                    const StrokeLineBuilder(strokeLineDirection: StrokeLineDirection.vertical),
                  ],
                ),
              ),
              Row(
                children: const [
                  EmptySpace(),
                  Expanded(
                    child: StrokeLineBuilder(strokeLineDirection: StrokeLineDirection.horizontal),
                  ),
                  EmptySpace(),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: WeatherTextStyle.bodyText2.copyWith(
            color: Get.find<AppColors>().primary,
          ),
        ),
      ],
    );
  }
}
