import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/consts/string.dart';
import 'package:weatherapp_starter_project/model/currentweathermodel.dart';
import 'package:weatherapp_starter_project/model/hourelyweather.dart';

var link =
    "https://api.openweathermap.org/data/2.5/weather?lat=$latitued&lon=$longitude&appid=$apiKey&units=metric";
// var hoverlink = "https://api.openweathermap.org/data/2.5/forecast?lat=$latitued&lon=$longitude&appid=$apiKey&units=metric";
var hoverlink =
    "https://api.openweathermap.org/data/2.5/forecast?lat=$latitued&lon=$longitude&appid=$apiKey&units=metric";

getcurrentweather() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherapiFromJson(res.body.toString());
    print("Data is received");
    return data;
  }
}

// getHoverlyweather() async {
//   var res = await http.get(Uri.parse(hoverlink));
//   if (res.statusCode == 200) {
//     var data = hourlyWeatherDetailsFromJson(res.body.toString());
//     print("Hourly is received");
//     return data;
//   }
// }
// Future getHoverlyweather() async {
//   try {
//   var res = await http.get(Uri.parse(hoverlink));
//     if (res.statusCode == 200) {
//       var data = await currentWeatherapiFromJson(res.body.toString()) as Map;
//       print("Data is received");
//       return data;
//     }
//   } catch (e) {
//     print(
//         "Error in u u getcurrentweather: $e");
//   }
// }
// Future<HourlyWeatherDetails> getHourlyWeather() async {
//   try {
//     var res = await http.get(Uri.parse(hoverlink));
//     if (res.statusCode == 200) {
//       var data = currentWeatherapiFromJson(res.body.toString());
//       print("Data is received");
//       return data;
//     }
//   } catch (e) {
//     print("Error in getHourlyWeather: $e");
//   }
// }

Future getHourlyWeather() async {
  try {
    var res = await http.get(Uri.parse(hoverlink));
    if (res.statusCode == 200) {
      var data = currentWeatherapiFromJson(res.body.toString());
      print("Data is received");
      return data ;
    }
  } catch (e) {
    print("Error in getHourlyWeather: $e");
  }
}
