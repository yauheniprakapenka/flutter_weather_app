import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final IconData icon;

  const WeatherIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(context) {
    return Icon(
      icon,
      color: const Color(0xFFf6cd55),
      size: 100,
    );
  }
}
