import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/const/app_symbols.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/widgets.dart';

class WeatherCard extends StatelessWidget {
  final bool isActive;
  final String? time;
  final int? celsium;
  final String? description;

  const WeatherCard({
    Key? key,
    this.isActive = false,
    this.time,
    this.celsium,
    this.description,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      height: 100,
      decoration: isActive
          ? BoxDecoration(border: Border.all(width: 2, color: context.read<AppColors>().secondary))
          : null,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: WeatherIcon(
              icon: Icons.light_mode_outlined,
              size: 52,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
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
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
                if (!isActive) const Divider(height: 3),
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
        fontSize: 34,
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
      time ?? '',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
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
