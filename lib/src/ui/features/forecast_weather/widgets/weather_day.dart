import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/theme/app_colors.dart';

class WeatherDay extends StatelessWidget {
  final String dayTitle;

  const WeatherDay({Key? key, this.dayTitle = ''}) : super(key: key);

  @override
  Widget build(context) {
    final border = BorderSide(width: 1, color: context.read<AppColors>().divider);
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(top: border, bottom: border),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
        child: Text(
          dayTitle.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
