import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/forecast_bloc.dart';
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
    BlocProvider.of<ForecastBloc>(context, listen: false).add(GetFiveDaysWeatherForecastEvent());
  }

  @override
  Widget build(context) {
    return BlocConsumer<ForecastBloc, ForecastState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          context.showToastMessage(text: state.errorMessage);
        }
      },
      builder: (_, state) {
        if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
        return Scaffold(
          appBar: AppBar(
            title: Text(state.forecast.city ?? ''),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<ForecastBloc>().add(RefreshGetFiveDaysWeatherForecastEvent());
            },
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: kMaxWidth),
                child: ListView(
                  children: [
                    ForecastList(forecast: state.forecast),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
