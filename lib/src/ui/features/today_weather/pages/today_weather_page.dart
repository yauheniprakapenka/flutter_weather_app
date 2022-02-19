import 'package:flutter/material.dart';

import '../../../../ui/shared/widgets/widgets.dart';
import '../../today_weather/decorators/divider_decorator.dart' as twdecorators;
import '../../today_weather/widgets/widgets.dart' as twwidgets;

class TodayWeatherPage extends StatelessWidget {
  const TodayWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Today',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const WeatherIcon(
            icon: Icons.light_mode_outlined,
          ),
          const Text('London, UK'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('22 C'),
              Text('|'),
              Text('Sunny'),
            ],
          ),
          const twwidgets.WeatherIndicatorIcon(title: '57%', icon: Icon(Icons.ac_unit)),
          const twdecorators.DividerDecorator(),
          const Icon(Icons.abc),
          const twdecorators.DividerDecorator(),
          const twwidgets.ShareButton(),
        ],
      ),
    );
  }
}
