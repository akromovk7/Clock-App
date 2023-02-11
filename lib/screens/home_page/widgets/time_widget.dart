import 'dart:async';

import 'package:flutter/material.dart';

class TimeInHourAndMinute extends StatefulWidget {
  bool isTablet = false;

  TimeInHourAndMinute({required this.isTablet});

  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_timeOfDay.hour} : ${_timeOfDay.minute}",
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(fontSize: widget.isTablet ? 160 : 90),
    );
  }
}
