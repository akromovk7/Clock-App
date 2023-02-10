import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:clock_app/core/components/themes.dart';
import 'package:clock_app/core/constants/const_route.dart';
import 'package:clock_app/routes/clock_route.dart';
import 'package:clock_app/screens/home_page/cubit/home_cubit.dart';
import 'package:clock_app/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AdaptiveTheme(
          light: AllTheme.lightTheme,
          dark: AllTheme.darkTheme,
          initial: AdaptiveThemeMode.dark,
          builder: ((light, dark) {
            return MaterialApp(
            navigatorKey: NavigationService.instance.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Clock App',
            theme: light,
            darkTheme: dark,
            onGenerateRoute: MyRoute.instance.myRoutes,
            initialRoute: homePage,
          );
          }),
          
        );
      },
    );
  }
}
