import 'package:flutter/material.dart';

class WeatherDay extends StatelessWidget {
  final String dayTitle;

  const WeatherDay({Key? key, this.dayTitle = ''}) : super(key: key);

  @override
  Widget build(context) {
    return Text(dayTitle.toUpperCase(),);
  }
}
