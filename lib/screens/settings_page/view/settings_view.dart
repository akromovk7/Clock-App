import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
      body: SafeArea(
        child: ListTile(
          leading: Icon(Icons.light_mode),
          onTap: () async {
            await _switchTheme();
          },
          title: Text(
            'dark_mode',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 17),
          ),
          trailing: CupertinoSwitch(
            activeColor: Colors.blue,
            value: themeMode != null ? themeMode!.isDark : false,
            onChanged: (value) async {
              await _switchTheme();
            },
          ),
        ),
      ),
    );
  }
}
