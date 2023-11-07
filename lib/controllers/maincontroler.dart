import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/servies/api_service.dart';

class Maincontroler extends GetxController {


@override
void onInit(){
  CurrentWeatherdata = getcurrentweather(); 
  hourelyweatherdata = getHourlyWeather();
  super.onInit();
}





  var isdark = false.obs;
  var CurrentWeatherdata;
  var hourelyweatherdata ;
  changetheme() {
    isdark.value = !isdark.value;
    Get.changeThemeMode(isdark.value? ThemeMode.dark:ThemeMode.light);
  }
}
