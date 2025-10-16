import 'package:flutter/material.dart';
import 'package:fokus/app/enums/timer_type.dart';
import 'package:fokus/app/pages/home_page.dart';
import 'package:fokus/app/pages/timer_page.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => HomePage(),
        '/timer': (_) => TimerPage(timerType: TimerType.focus),
        '/short-break': (_) => TimerPage(timerType: TimerType.shortBreak),
        '/long-break': (_) => TimerPage(timerType: TimerType.longBreak),
      },
      debugShowCheckedModeBanner: false,
      title: 'Fokus',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.unboundedTextTheme(),
      ),
      initialRoute: '/',
    );
  }
}
