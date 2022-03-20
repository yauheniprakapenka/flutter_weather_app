import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_ui/weather_ui.dart';

import '../../../../ui/features/forecast_weather/bloc/forecast_bloc.dart';
import '../../../../ui/features/forecast_weather/composites/forecast_list.dart';
import '../../../shared/widgets/side_menu.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ForecastBloc>(context, listen: false).add(GetFiveDaysWeatherForecastEvent());
  }

  @override
  Widget build(context) {
    return BlocConsumer<ForecastBloc, ForecastState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          context.showToastMessage(text: state.errorMessage);
        }
      },
      builder: (_, state) {
        if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
        return Scaffold(
          key: _scaffoldKey,
          drawer: const SideMenu(),
          appBar: AppBar(
            title: Text(state.forecast.city ?? ''),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(PatternWidgetConfig.heightSize),
              child: PatternedLine(),
            ),
            leading: Responsive.isMobile(context)
                ? IconButton(
                    icon: Icon(Icons.menu, color: Get.find<AppColors>().secondary),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  )
                : null,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<ForecastBloc>().add(RefreshGetFiveDaysWeatherForecastEvent());
            },
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: kMaxWidth),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: ListView(
                    children: [
                      ForecastList(forecast: state.forecast),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
