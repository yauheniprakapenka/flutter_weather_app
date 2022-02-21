import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final Weather weather;

  const ShareButton({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(context) {
    return TextButton(
      onPressed: () {
        Share.share(weather.toString());
      },
      child: const Text(
        'Share',
      ),
    );
  }
}
