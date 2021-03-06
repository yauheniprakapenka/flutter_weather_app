import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:ui/ui.dart';

import '../../app/shared/assets/weather_assets.dart';
import '../../app/shared/localization/locale_provider.dart';
import 'controller/tabbar_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final tabbarCntrl = context.watch<TabbarController>();
    return Scaffold(
      body: tabbarCntrl.pages.elementAt(tabbarCntrl.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: tabbarCntrl.setIndex,
        type: BottomNavigationBarType.fixed,
        currentIndex: tabbarCntrl.selectedIndex,
        unselectedItemColor: Get.find<AppColors>().inActive,
        selectedItemColor: Get.find<AppColors>().primary,
        backgroundColor: Get.find<AppColors>().backgroundGradientEnd,
        items: [
          BottomNavigationBarItem(
            label: context.l10n?.tabbarNavigationTodayLabel ?? '-',
            icon: const Icon(Icons.light_mode_outlined),
          ),
          BottomNavigationBarItem(
            label: context.l10n?.tabbarNavigationForecaseLabel ?? '-',
            /// Не перекрашивается svg иконка, поэтому добавлен [isActive]
            icon: WeatherAssets().forecast(isActive: tabbarCntrl.selectedIndex == 1),
          ),
        ],
      ),
    );
  }
}
