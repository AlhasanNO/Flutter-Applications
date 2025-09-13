import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fitness_magazine/views/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final List<Locale> appSupportedLocales = const [Locale('ar')];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Magazine',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0, // This removes the shadow from all App Bars.
          scrolledUnderElevation: 0,
          backgroundColor: Color(0xFF364046),
        ),
      ),
      supportedLocales: appSupportedLocales,
      home: HomePage(),
    );
  }
}
