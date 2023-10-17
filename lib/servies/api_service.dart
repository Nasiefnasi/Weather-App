import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/consts/string.dart';
import 'package:weatherapp_starter_project/model/currentweathermodel.dart';
var link = "https://api.openweathermap.org/data/2.5/weather?lat=$latitued&lon=$longitude&appid=$apiKey";

getcurrentweather()async{
  var res = await http.get(Uri.parse(link));
  if(res.statusCode==200){
    var data = currentWeatherapiFromJson(res.body.toString());
    print("Data is received");
    return data ;
  }
}