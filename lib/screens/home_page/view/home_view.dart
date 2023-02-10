import 'package:clock_app/core/constants/const_route.dart';
import 'package:clock_app/service/navigation_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                NavigationService.instance.pushNamed(routeName: settingsPage);
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
