import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:clock_app/core/base/size_extension.dart';
import 'package:clock_app/core/constants/const_route.dart';
import 'package:clock_app/core/constants/image_const.dart';
import 'package:clock_app/service/navigation_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          // height: context.height,
          width: context.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Theme.of(context).scaffoldBackgroundColor == Colors.white
                      ? AppImages.background
                      : AppImages.backgroundLight,
                ),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: context.height * 0.17),
                  height: context.height * 0.6,
                  width: context.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Theme.of(context).cardColor, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.height * 0.2,
                    width: context.width * 0.2,
                    child: Image.asset(AppImages.gerb),
                  ),
                  SizedBox(height: context.height * 0.01),
                  Text(
                    '11 : 27',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: context.height * 0.01),
                  Text(
                    "12 май",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    "Сешанба",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: context.height * 0.2,
                        width: context.width * 0.4,
                        child: Image.asset(AppImages.partlyCloudy),
                      ),
                      Column(
                        children: [
                          Text(
                            "+27°",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            "Тошкент",
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                    Theme.of(context).scaffoldBackgroundColor == Colors.white
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                onPressed: () async {
                  await _switchTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
