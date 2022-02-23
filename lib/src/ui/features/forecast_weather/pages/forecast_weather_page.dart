import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import 'package:flutter_weather_app/src/domain/lib/src/providers/weather_provider/events/get_five_days_weather_forecast_event.dart';

import '../../../shared/widgets/patterned_line/pattern_widget_config.dart';
import '../../today_weather/widgets/widgets.dart';
import '../composites/forecast_list.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(GetFiveDaysWeatherForecastEvent());
  }

  @override
  Widget build(context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (_, state) {
        if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
        if (state.error.isNotEmpty) {
          return Center(child: Text(state.error, textAlign: TextAlign.center));
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(state.forecast.city ?? ''),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(PatternWidgetConfig.heigthSize),
              child: PatternedLine(),
            ),
          ),
          body: ListView(
            children: [
              ForecastList(forecast: state.forecast),
            ],
          ),
        );
      },
    );
  }
}
