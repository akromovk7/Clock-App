import 'dart:ui';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:clock_app/core/base/size_extension.dart';
import 'package:clock_app/core/constants/image_const.dart';
import 'package:clock_app/screens/home_page/widgets/time_widget.dart';
import 'package:flutter/material.dart';

final _widthThreshold = 600.0;

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AdaptiveThemeMode? themeMode;

  Future<void> _getMode() async {
    themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  Future<void> _switchTheme() async {
    if (themeMode!.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
    await _getMode();
  }

  @override
  void initState() {
    _getMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = window.physicalSize / window.devicePixelRatio;
    final width = context.width;
    final isTablet = width > _widthThreshold;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Theme.of(context).scaffoldBackgroundColor == Colors.white
                      ? AppImages.background
                      : AppImages.backgroundLight,
                ),
                fit: isTablet ? BoxFit.contain : BoxFit.cover),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: isTablet
                          ? context.height * 0.29
                          : context.height * 0.17),
                  height:
                      isTablet ? context.height * 0.5 : context.height * 0.6,
                  width: context.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Theme.of(context).cardColor,
                        width: isTablet ? 4 : 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Positioned(
                left: isTablet ? context.width * 0.4 : context.width * 0.4,
                child: SizedBox(
                  height: context.height * 0.2,
                  width: context.width * 0.2,
                  child: Image.asset(AppImages.gerb),
                ),
              ),
              SizedBox(height: context.height * 0.01),
              Positioned(
                left: isTablet ? context.width * 0.17 : context.width * 0.165,
                top: isTablet ? context.height * 0.23 : context.height * 0.22,
                child: TimeInHourAndMinute(isTablet: isTablet,),
                
              ),
              SizedBox(height: context.height * 0.01),
              Positioned(
                left: isTablet ? context.width * 0.6 : context.width * 0.25,
                top: isTablet ? context.height * 0.235 : context.height * 0.4,
                child: Text(
                  "12 май",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Positioned(
                left: isTablet ? context.width * 0.6 : context.width * 0.2,
                top: isTablet ? context.height * 0.33 : context.height * 0.5,
                child: Text(
                  "Сешанба",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              const Spacer(),
              Positioned(
                left: isTablet ? context.width * 0.15 : context.width * 0.12,
                top: isTablet ? context.height * 0.65 : context.height * 0.675,
                child: SizedBox(
                  height:
                      isTablet ? context.height * 0.15 : context.height * 0.3,
                  width: isTablet ? context.width * 0.15 : context.width * 0.3,
                  child: Image.asset(AppImages.partlyCloudy),
                ),
              ),
              Positioned(
                left: isTablet ? context.width * 0.4 : context.width * 0.5,
                top: isTablet ? context.height * 0.68 : context.height * 0.7,
                child: Text(
                  "+27°",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Positioned(
                left: isTablet ? context.width * 0.6 : context.width * 0.5,
                top: isTablet ? context.height * 0.7 : context.height * 0.83,
                child: Text(
                  "Тошкент",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Positioned(
                left: isTablet ? context.width * 0.85 : context.width * 0.0,
                top: isTablet ? context.height * 0.8 : context.height * 0.0,
                child: IconButton(
                  icon: Icon(
                      Theme.of(context).scaffoldBackgroundColor == Colors.white
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      size: isTablet ? 45 : 30,
                      color: Theme.of(context).cardColor),
                  onPressed: () async {
                    await _switchTheme();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
