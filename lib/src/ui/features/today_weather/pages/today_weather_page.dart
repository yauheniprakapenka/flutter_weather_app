import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_ui/weather_ui.dart';

import '../../../../ui/features/today_weather/bloc/today_weather_bloc.dart';
import '../../../../ui/features/today_weather/decorators/divider_decorator.dart';
import '../../../../ui/features/today_weather/extensions/wind_direction_extension.dart';
import '../../../../ui/features/today_weather/reports/share_report.dart';
import '../../../../ui/features/today_weather/reports/today_weather_report.dart';
import '../../../../ui/features/today_weather/widgets/weather_indicator_icon/weather_indicator_icon.dart';
import '../../../../ui/features/today_weather/widgets/weather_indicator_icon/widgets/language_flag.dart';
import '../../../../ui/features/today_weather/widgets/weather_indicator_icon/widgets/language_picker.dart';
import '../../../../ui/shared/const/app_symbols.dart';
import '../../../../ui/shared/extensions/kelvin_to_celsius_extension.dart';
import '../../../../ui/shared/localization/extensions/l10n_extension.dart';

class TodayWeatherPage extends StatelessWidget {
  const TodayWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    BlocProvider.of<TodayWeatherBloc>(context, listen: false).add(GetTodayWeatherEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n?.todayPageTodayAppbarLabel ?? ''),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(PatternWidgetConfig.heightSize),
          child: PatternedLine(),
        ),
        actions: [
          Row(
            children: const [
              LanguageFlag(size: 22),
              SizedBox(width: 8),
              LanguagePicker(),
            ],
          ),
        ],
      ),
      body: BlocBuilder<TodayWeatherBloc, TodayWeatherState>(
        builder: (context, state) {
          if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
          if (state.error.isNotEmpty) {
            return Center(
              child: Text(
                state.error,
                textAlign: TextAlign.center,
                style: WeatherTextStyle.bodyText2,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<TodayWeatherBloc>().add(RefreshTodayWeatherEvent());
            },
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('http://openweathermap.org/img/wn/${state.weather.icon}@2x.png'),
                    Text(
                      '${state.weather.city}, ${state.weather.codeCountry}',
                      style: WeatherTextStyle.headline6,
                    ),
                    Text(
                      '${_getTemperature(state.weather.temperature)} | ${state.weather.weather}',
                      style: WeatherTextStyle.headline5.copyWith(
                        color: Get.find<AppColors>().secondary,
                      ),
                    ),
                    const DividerDecorator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherIndicatorIcon(
                          title: '${state.weather.humidity ?? '-'}%',
                          icon: Assets.rain,
                        ),
                        WeatherIndicatorIcon(
                          title: '${state.weather.rainVolume ?? '-'} mm',
                          icon: Assets.water,
                        ),
                        WeatherIndicatorIcon(
                          title: '${state.weather.pressure ?? '-'} hPa',
                          icon: Assets.celsius,
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
                            color: Get.find<AppColors>().primary,
                            size: 40,
                          ),
                        ),
                        WeatherIndicatorIcon(
                          title: _getWeatherIndicatorTitle(state.weather.windDegrees),
                          icon: Icon(
                            Icons.explore_outlined,
                            color: Get.find<AppColors>().primary,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const DividerDecorator(),
                    TextButton(
                      onPressed: () async {
                        await shareReport(createTodayWeatherReport(state.weather));
                      },
                      child: Text(context.l10n?.shareButtonText ?? ''),
                    ),
                  ],
                ),
              ),
            ),
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
