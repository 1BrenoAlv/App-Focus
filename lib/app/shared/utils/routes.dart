import 'package:flutter/widgets.dart';
import 'package:fokus/app/shared/enums/timer_type.dart';
import 'package:fokus/app/view/pages/home_page.dart';
import 'package:fokus/app/view/pages/timer_page.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (context) => HomePage(),
  '/timer': (context) => TimerPage(
    timerType:
        ModalRoute.of(context)?.settings.arguments as TimerType? ??
        TimerType.focus,
  ),
  '/short-break': (context) => TimerPage(
    timerType:
        ModalRoute.of(context)?.settings.arguments as TimerType? ??
        TimerType.shortBreak,
  ),
  '/long-break': (context) => TimerPage(
    timerType:
        ModalRoute.of(context)?.settings.arguments as TimerType? ??
        TimerType.longBreak,
  ),
};
