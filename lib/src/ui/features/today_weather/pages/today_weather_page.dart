import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/src/ui/shared/extensions/extensions.dart';
import 'package:flutter_weather_app/src/ui/shared/widgets/language_flag.dart';
import 'package:flutter_weather_app/src/ui/shared/widgets/language_picker.dart';
import 'package:flutter_weather_app/src/ui/state_management/weather_bloc/weather_state_management.dart';

import '../../../shared/const/app_symbols.dart';
import '../../../shared/widgets/patterned_line/pattern_widget_config.dart';
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
    context.read<WeatherBloc>().add(GetTodayWeatherEvent());
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.today ?? ''),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(PatternWidgetConfig.heigthSize),
          child: PatternedLine(),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
          if (state.error.isNotEmpty) {
            return Center(child: Text(state.error, textAlign: TextAlign.center));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LanguageFlag(),
              const LanguagePicker(),
              Image.network('http://openweathermap.org/img/wn/${state.weather.icon}@2x.png'),
              Text(
                '${state.weather.city}, ${state.weather.codeCountry}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '${_getTemperature(state.weather.temperature)} | ${state.weather.weather}',
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
                    title: '${state.weather.humidity ?? '-'}%',
                    icon: SvgPicture.asset(
                      'assets/icons/rain.svg',
                      color: Theme.of(context).primaryColor,
                      height: 32,
                    ),
                  ),
                  WeatherIndicatorIcon(
                    title: '${state.weather.rainVolume ?? '-'} mm',
                    icon: SvgPicture.asset(
                      'assets/icons/water.svg',
                      color: Theme.of(context).primaryColor,
                      height: 32,
                    ),
                  ),
                  WeatherIndicatorIcon(
                    title: '${state.weather.pressure ?? '-'} hPa',
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
                    title: '${state.weather.windSpeed ?? '-'} km/h',
                    icon: Icon(
                      Icons.air,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                  ),
                  WeatherIndicatorIcon(
                    title: _getWeatherIndicatorTitle(state.weather.windDegrees),
                    icon: Icon(
                      Icons.explore_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const DividerDecorator(),
              ShareButton(weather: state.weather),
            ],
          );
        },
      ),
    );
  }

  String _getWeatherIndicatorTitle(int? windDegrees) {
    if (windDegrees == null) return '-';
    return windDegrees.getWindDirectionTitle();
  }

  String _getTemperature(double? temperature) {
    if (temperature == null) return '-';
    return '${temperature.convertKelvinToCelsium()}${AppSymbols.celsium}';
  }
}
