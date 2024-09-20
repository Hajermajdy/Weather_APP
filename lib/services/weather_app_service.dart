import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_app_model.dart';

class WeatherAppService {
  String apiKey = "55487df10de148bd806124916231610";
  String baseUrl = 'https://api.weatherapi.com/v1';
  final dio = Dio();

  Future<WeatherAppModel> getCurrentMethods({required String city}) async {
    try {
      final response =
          await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$city");
      WeatherAppModel weatherAppModel = WeatherAppModel.fromJson(response.data);

      return weatherAppModel;
    } on DioException catch (e) {
      throw Exception("Failed to fetch weather data: $e");
    }
  }
}
