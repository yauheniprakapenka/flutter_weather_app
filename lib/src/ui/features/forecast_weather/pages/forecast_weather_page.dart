import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ui/weather_ui.dart';

import '../../../../ui/features/forecast_weather/bloc/forecast_bloc.dart';
import '../../../../ui/features/forecast_weather/composites/forecast_list.dart';

class ForecastWeatherPage extends StatelessWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    context.read<ForecastBloc>().add(GetFiveDaysWeatherForecastEvent());
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (_, state) {
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
        return Scaffold(
          appBar: AppBar(
            title: Text(state.forecast.city ?? ''),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(PatternWidgetConfig.heightSize),
              child: PatternedLine(),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<ForecastBloc>().add(RefreshGetFiveDaysWeatherForecastEvent());
            },
            child: ListView(
              children: [
                ForecastList(forecast: state.forecast),
              ],
            ),
          ),
        );
      },
    );
  }
}
