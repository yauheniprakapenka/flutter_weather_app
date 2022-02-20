import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final IconData icon;

  const WeatherIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(context) {
    return Icon(
      icon,
      color: Theme.of(context).primaryColor,
      size: 100,
    );
  }
}
