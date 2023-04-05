import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import 'base_service.dart';

class WeatherService {
  BaseService service = BaseService();
  static const String apiKey = "208d77477bff3452af511fd7a983edbb";

  Future<Response> getWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double longitude = position.longitude;
      double latitude = position.latitude;
      Response response = await service.request(
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric",
          method: "Get");
      print("_++++++++++++++++++${response.statusCode}");
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
