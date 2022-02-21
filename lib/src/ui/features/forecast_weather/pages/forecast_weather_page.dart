import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import 'package:flutter_weather_app/src/domain/lib/src/providers/weather_provider/events/get_five_days_weather_forecast_event.dart';
import '../widgets/widgets.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('London'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: WeatherDay(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.forecast.weather?.length,
                  itemBuilder: (context, index) {
                    return const WeatherCard();
                  },
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
