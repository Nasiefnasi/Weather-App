import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/consts/colors.dart';

class CustomThemes {
  static final lightThems = ThemeData(cardColor: Colors.white,
    fontFamily: "poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Vx.gray800,
    iconTheme: IconThemeData(color: Vx.gray600),
  );
  static final darkThems = ThemeData(cardColor: bgcolor,
    fontFamily: "poppins",
    scaffoldBackgroundColor: bgcolor.withOpacity(0.6),
    primaryColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
