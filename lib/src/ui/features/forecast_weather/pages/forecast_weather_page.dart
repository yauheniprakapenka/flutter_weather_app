import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ForecastWeatherPage extends StatelessWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('London'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: WeatherDay(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const WeatherCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
