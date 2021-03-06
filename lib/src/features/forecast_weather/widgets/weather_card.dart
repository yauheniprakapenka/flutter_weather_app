import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/ui.dart';

import '../../../app/shared/localization/locale_provider.dart';

class WeatherCard extends StatelessWidget {
  final bool hasActiveBorder;
  final bool hasBottomBorder;
  final String? time;
  final int? celsius;
  final String? description;
  final String? icon;

  const WeatherCard({
    Key? key,
    this.hasActiveBorder = false,
    this.hasBottomBorder = true,
    this.time,
    this.celsius,
    this.description,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(context) {
    final appColors = Get.find<AppColors>();
    return Container(
      height: 88,
      decoration: BoxDecoration(
        border: hasActiveBorder
            ? Border.fromBorderSide(
                BorderSide(width: 3, color: appColors.primary),
              )
            : null,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.network(
              'http://openweathermap.org/img/wn/$icon@2x.png',
              errorBuilder: (_, __, ___) {
                return const Icon(Icons.help_outline);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _Time(time: time),
                              const SizedBox(height: 4),
                              _Description(description: description),
                            ],
                          ),
                        ),
                        _Celsius(celsium: celsius),
                      ],
                    ),
                  ),
                ),
                if (hasBottomBorder) Container(height: 1, color: appColors.divider),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Celsius extends StatelessWidget {
  final int? celsium;

  const _Celsius({Key? key, this.celsium}) : super(key: key);

  @override
  Widget build(context) {
    return Text(
      '${celsium ?? '-'}${context.l10n?.temperatureSymbolCelsius}',
      style: WeatherTextStyle.headline4.copyWith(
        color: Get.find<AppColors>().primary,
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final String? time;

  const _Time({Key? key, this.time}) : super(key: key);

  @override
  Widget build(context) {
    return Text(
      _getFormatterTime(),
      style: WeatherTextStyle.bodyText1.copyWith(color: Get.find<AppColors>().primary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  String _getFormatterTime() {
    final parsedDate = DateTime.parse(time ?? '');
    final hour = '${parsedDate.hour}'.padLeft(2, '0');
    final minute = '${parsedDate.minute}'.padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _Description extends StatelessWidget {
  final String? description;

  const _Description({Key? key, this.description}) : super(key: key);

  @override
  Widget build(context) {
    return Text(
      description ?? '-',
      style: WeatherTextStyle.bodyText2.copyWith(color: Get.find<AppColors>().primary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
