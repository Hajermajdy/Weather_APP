class WeatherAppModel {
  String? city;
  String? county;
  String? localTime;
  double? maxTemp;
  double? minTemp;
  double? averageTemp;
  String? weatherState;
  double? windkph;
  int? humidity;

  // Generative Constructors
  WeatherAppModel({
    required this.averageTemp,
    required this.city,
    required this.county,
    required this.humidity,
    required this.localTime,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.windkph,
  });

  // factory constructor
  factory WeatherAppModel.fromJson(json) {
    return WeatherAppModel(
      averageTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      city: json['location']['name'],
      county: json['location']['country'],
      localTime: json['location']['localtime'],
      humidity: json['current']['humidity'],
      // localTime: json['current']['last_updated'],
      weatherState: json['current']['condition']['text'],
      windkph: json['current']['wind_kph'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
