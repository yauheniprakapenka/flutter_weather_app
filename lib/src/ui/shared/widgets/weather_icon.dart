import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const WeatherIcon({
    Key? key,
    required this.icon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Icon(
      icon,
      color: Theme.of(context).primaryColor,
      size: size,
    );
  }
}
