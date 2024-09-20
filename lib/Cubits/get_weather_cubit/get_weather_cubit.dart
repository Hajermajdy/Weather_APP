import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_app_model.dart';
import 'package:weather_app/services/weather_app_service.dart';

// create cubit (2)
class GetWeatherCubit extends Cubit<WeatherAppState> {
  GetWeatherCubit() : super(Noweather());

  WeatherAppModel? weatherAppModel;
  // create function and used valued emit
  getWeather({required String cityname}) async {
    try {
      emit(Weatherloading());
      weatherAppModel =
          await WeatherAppService().getCurrentMethods(city: cityname);
      emit(WeatherSuccessfully());
    } catch (e) {
      emit(WeatherFailer());
    }
  }
}
