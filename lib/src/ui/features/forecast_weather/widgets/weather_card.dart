import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/const/app_symbols.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/widgets.dart';

class WeatherCard extends StatelessWidget {
  final bool isActive;

  const WeatherCard({Key? key, this.isActive = false}) : super(key: key);

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
              size: 60,
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
                          children: const [
                            _Time(),
                            SizedBox(height: 4),
                            _Description(),
                          ],
                        ),
                      ),
                      const _Celsium(),
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
  const _Celsium({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Text(
      '22${AppSymbols.celsium}',
      style: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.w500,
        color: context.read<AppColors>().secondary,
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const Text(
      '19:00',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const Text(
      'Rain shower',
      style: TextStyle(
        fontSize: 16,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
