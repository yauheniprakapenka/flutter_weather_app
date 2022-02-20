import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import 'package:flutter_weather_app/src/ui/extensions/wind_direction_extension.dart';

import '../../../../ui/shared/widgets/widgets.dart';
import '../../../shared/const/app_symbols.dart';
import '../../today_weather/decorators/divider_decorator.dart';
import '../../today_weather/widgets/widgets.dart';

class TodayWeatherPage extends StatefulWidget {
  const TodayWeatherPage({Key? key}) : super(key: key);

  @override
  State<TodayWeatherPage> createState() => _TodayWeatherPageState();
}

class _TodayWeatherPageState extends State<TodayWeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(GetCurrentLocationWeatherEvent());
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const WeatherIcon(
                icon: Icons.light_mode_outlined,
                size: 100,
              ),
              Text(
                '${state.weather.city}, ${state.weather.codeCountry}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '${state.weather.temperature}${AppSymbols.celsium} | ${state.weather.weather}',
                style: const TextStyle(
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
                    title: '${state.weather.humidity}%',
                    icon: SvgPicture.asset(
                      'assets/icons/rain.svg',
                      color: Theme.of(context).primaryColor,
                      height: 32,
                    ),
                  ),
                  WeatherIndicatorIcon(
                    title: '${state.weather.rainVolume} mm',
                    icon: SvgPicture.asset(
                      'assets/icons/water.svg',
                      color: Theme.of(context).primaryColor,
                      height: 32,
                    ),
                  ),
                  WeatherIndicatorIcon(
                    title: '${state.weather.pressure} hPa',
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
                    title: '${state.weather.windSpeed} km/h',
                    icon: Icon(
                      Icons.air,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                  ),
                  WeatherIndicatorIcon(
                    title: state.weather.windDegrees.getWindDirectionTitle(),
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
          );
        },
      ),
    );
  }
}
