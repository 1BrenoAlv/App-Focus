import 'package:flutter/material.dart';
import 'package:fokus/app/shared/utils/routes.dart';
import 'package:fokus/app/view-model/time_viewModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerViewModel(),
      child: MaterialApp(
        routes: routes,
        debugShowCheckedModeBanner: false,
        title: 'Fokus',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.unboundedTextTheme(),
        ),
        initialRoute: '/',
      ),
    );
  }
}
