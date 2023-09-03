// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:e_derma/global/api_keys.dart';
// import 'package:e_derma/models/weather_model.dart';
// import 'package:e_derma/services/location_service.dart';
//
// class WeatherService{
//
//   static Weather? currentWeather;
//
//   Future<Map> getCurrentWeather() async{
//     var locationService = LocationService();
//     var currentLocation = await locationService.getLocation();
//
//     late Map weather;
//
//     var lat = currentLocation?.latitude;
//     var long = currentLocation?.longitude;
//     var response = await http.get(
//         Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=${ApiKeys.weatherApiKey}')
//     ).then((value){
//       print(value.body);
//       weather = jsonDecode(value.body);
//       print(weather['main']['temp']);
//       print(weather["weather"][0]['main']);
//       print(weather['main']['humidity']);
//
//       currentWeather = Weather.fromJson(jsonDecode(value.body));
//
//     });
//     return {
//       'temp': weather['main']['temp']- 273.15,
//       'humidity': weather['main']['humidity'],
//       'main': weather['weather'][0]['main'].toString()
//     };
//   }
//
// }