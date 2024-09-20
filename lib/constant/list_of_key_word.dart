import 'package:weather_app/constant/image_paths.dart';

class ListOfKeyWords{
  final List<String> sunnyimageState = [
    ImagePath().sunnyWeather1,
    ImagePath().sunnyWeather2,
    ImagePath().sunnyWeather3,
  ];
  final List<String> snowimageState = [
    ImagePath().snowWeather1,
    ImagePath().snowWeather2,
    ImagePath().snowWeather3,
  ];
  final List<String> rainimageState = [
    ImagePath().rainweather1,
    ImagePath().rainWeather2,
    ImagePath().rainWeather3,
  ];
  final List<String> mistimageState = [
    ImagePath().clearWeather2,
    ImagePath().clearWeather2,
    ImagePath().clearWeather2,
  ];
  // this state appear when night of state weather and sunny in morning
  final List<String> clearimageState = [
    ImagePath().clearWeather1,
    ImagePath().clearWeather2,
    ImagePath().clearWeather3,
  ];
}