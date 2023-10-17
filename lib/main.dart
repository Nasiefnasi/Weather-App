import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/consts/themes.dart';
import 'package:weatherapp_starter_project/design/weatherapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.lightThems,
      darkTheme: CustomThemes.darkThems,
      themeMode: ThemeMode.system,
      home: const WeatherApp(),
    );
  }
}
