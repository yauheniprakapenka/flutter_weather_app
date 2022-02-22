import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/const/app_symbols.dart';
import '../../../shared/theme/app_colors.dart';

class WeatherCard extends StatelessWidget {
  final bool hasActiveBorder;
  final bool hasBottomBorder;
  final String? time;
  final int? celsium;
  final String? description;
  final String? icon;

  const WeatherCard({
    Key? key,
    this.hasActiveBorder = false,
    this.hasBottomBorder = true,
    this.time,
    this.celsium,
    this.description,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        border: hasActiveBorder ? Border.all(width: 3, color: context.read<AppColors>().secondary) : null,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.network('http://openweathermap.org/img/wn/$icon@2x.png'),
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
                        _Celsium(celsium: celsium),
                      ],
                    ),
                  ),
                ),
                if (hasBottomBorder) Container(height: 1, color: context.read<AppColors>().divider),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Celsium extends StatelessWidget {
  final int? celsium;

  const _Celsium({Key? key, this.celsium}) : super(key: key);

  @override
  Widget build(context) {
    return Text(
      '${celsium ?? '-'}${AppSymbols.celsium}',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w500,
        color: context.read<AppColors>().secondary,
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
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
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
      style: const TextStyle(
        fontSize: 16,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
