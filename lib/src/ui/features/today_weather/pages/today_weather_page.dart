import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:ui/ui.dart';

import '../../../../app/utils/app_version/app_version.dart';
import '../../../../ui/features/today_weather/bloc/today_weather_bloc.dart';
import '../../../../ui/features/today_weather/extensions/wind_direction_extension.dart';
import '../../../../ui/features/today_weather/reports/share_report.dart';
import '../../../../ui/features/today_weather/reports/today_weather_report.dart';
import '../../../../ui/features/today_weather/widgets/weather_indicator_icon/weather_indicator_icon.dart';
import '../../../../ui/shared/extensions/kelvin_to_celsius_extension.dart';
import '../../../../ui/shared/widgets/language_picker/language_picker.dart';
import '../../../shared/assets/assets.dart';

class TodayWeatherPage extends StatefulWidget {
  const TodayWeatherPage({Key? key}) : super(key: key);

  @override
  State<TodayWeatherPage> createState() => _TodayWeatherPageState();
}

class _TodayWeatherPageState extends State<TodayWeatherPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodayWeatherBloc>(context, listen: false).add(GetTodayWeatherEvent());
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Get.find<AppColors>().backgroudnGradientStart,
                Get.find<AppColors>().backgroudnGradientEnd,
              ],
            ),
          ),
          child: BlocConsumer<TodayWeatherBloc, TodayWeatherState>(
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                context.showToastMessage(text: state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<TodayWeatherBloc>().add(RefreshTodayWeatherEvent());
                      },
                      child: SingleChildScrollView(
                        // physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: _getHeight(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 100),
                              _WeatherInfo(state: state),
                              const Spacer(),
                              _Indicators(state: state),
                              const SizedBox(height: 24),
                              Text(
                                Get.find<AppVersion>().versionAndBuild,
                                style: WeatherTextStyle.caption.copyWith(
                                  color: Get.find<AppColors>().primary,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(top: 0, left: 24, child: LanguagePicker()),
                  Positioned(
                    top: 0,
                    right: 12,
                    child: IconButton(
                      onPressed: () async {
                        await shareReport(createTodayWeatherReport(state.weather));
                      },
                      icon: Icon(Icons.send, color: Get.find<AppColors>().accent),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  double _getHeight() {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight - kBottomNavigationBarHeight - kToolbarHeight;
  }
}

class _WeatherInfo extends StatelessWidget {
  final TodayWeatherState state;

  const _WeatherInfo({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${state.weather.city}, ${state.weather.codeCountry}',
          style: WeatherTextStyle.headline6.copyWith(
            color: Get.find<AppColors>().primary,
          ),
        ),
        Image.network(
          'http://openweathermap.org/img/wn/${state.weather.icon}@2x.png',
          errorBuilder: (_, __, ___) {
            return const Icon(Icons.help_outline);
          },
        ),
        Text(
          _getTemperature(state.weather.temperature),
          style: WeatherTextStyle.headline5.copyWith(
            color: Get.find<AppColors>().primary,
          ),
        ),
        Text(
          '${state.weather.weather}',
          style: WeatherTextStyle.headline5.copyWith(
            color: Get.find<AppColors>().primary,
          ),
        ),
      ],
    );
  }

  String _getTemperature(num? temperature) {
    if (temperature == null) return '-';
    return '${temperature.convertKelvinToCelsium()}${AppSymbols.celsium}';
  }
}

class _Indicators extends StatelessWidget {
  final TodayWeatherState state;

  const _Indicators({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherIndicatorIcon(
          title: '${state.weather.humidity ?? '-'} %',
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
    );
  }

  String _getWeatherIndicatorTitle(int? windDegrees) {
    if (windDegrees == null) return '-';
    return windDegrees.getWindDirectionTitle();
  }
}
