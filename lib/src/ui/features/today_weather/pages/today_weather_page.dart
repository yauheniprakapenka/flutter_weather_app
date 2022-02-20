import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../ui/shared/widgets/widgets.dart';
import '../../today_weather/decorators/divider_decorator.dart';
import '../../today_weather/widgets/widgets.dart';

class TodayWeatherPage extends StatelessWidget {
  const TodayWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const WeatherIcon(
            icon: Icons.light_mode_outlined,
          ),
          const Text(
            'London, UK',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            '22 C | Sunny',
            style: TextStyle(
              color: Color(0xFF4e91f7),
              fontSize: 28,
              fontWeight: FontWeight.w300,
            ),
          ),
          const DividerDecorator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherIndicatorIcon(
                title: '57%',
                icon: SvgPicture.asset(
                  'assets/icons/rain.svg',
                  color: Theme.of(context).primaryColor,
                  height: 32,
                ),
              ),
              WeatherIndicatorIcon(
                title: '1.0 mm',
                icon: SvgPicture.asset(
                  'assets/icons/water.svg',
                  color: Theme.of(context).primaryColor,
                  height: 32,
                ),
              ),
              WeatherIndicatorIcon(
                title: '1019 hPa',
                icon: SvgPicture.asset(
                  'assets/icons/celsius.svg',
                  color: Theme.of(context).primaryColor,
                  height: 44,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherIndicatorIcon(
                title: '20 km/h',
                icon: Icon(
                  Icons.air,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
              ),
              WeatherIndicatorIcon(
                title: 'SE',
                icon: Icon(
                  Icons.explore_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
              ),
            ],
          ),
          const DividerDecorator(),
          const ShareButton(),
        ],
      ),
    );
  }
}
