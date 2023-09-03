
class Weather {
  num temp;
  num feelsLike;
  num humidity;
  num high;
  num low;

  Weather(
      {required this.temp,
      required this.feelsLike,
      required this.humidity,
      required this.high,
      required this.low});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        temp: json['main']['temp']- 273.15,
        feelsLike: json['main']['feels_like']- 273.15,
        humidity: json['main']['humidity'],
        high: json['main']["temp_max"]- 273.15,
        low: json['main']['temp_min']- 273.15);
  }

}
