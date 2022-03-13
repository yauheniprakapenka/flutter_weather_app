import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ui/features/forecast_weather/bloc/forecast_bloc.dart';
import '../../../../ui/features/forecast_weather/composites/forecast_list.dart';
import '../../../../ui/shared/widgets/patterned_line/widget.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<ForecastBloc>().add(GetFiveDaysWeatherForecastEvent());
  }

  @override
  Widget build(context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (_, state) {
        if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
        if (state.error.isNotEmpty) {
          return Center(child: Text(state.error, textAlign: TextAlign.center));
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(state.forecast.city ?? ''),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(PatternWidgetConfig.heightSize),
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
