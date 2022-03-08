import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/helper/dio_helper.dart';
import 'package:weather_app/models/weather_model.dart';

class HomeController extends GetxController {
  late Position position;
  late WeatherModel weatherModel;
  bool isLoading = true;

  @override
  onInit() async {
    isLoading = true;

    super.onInit();
    await getDataForCurrentLocation();
    isLoading = false;
    update();
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      } else {
        throw Exception('Error');
      }
    }

    position = await Geolocator.getCurrentPosition();
  }

  Future<void> getDataForCurrentLocation() async {
    try {
      await getCurrentLocation();
      var response = await DioHelper.instance.getData(
        endPoint: "forecast.json",
        query: {
          "key": k_apiKey,
          "q": "${position.latitude},${position.longitude}",
          "days": 7,
        },
      );
      if (response.statusCode != 200) return;
      weatherModel = WeatherModel.fromJson(response.data);
      print(weatherModel.forecast!.forecastday!.length);
    } catch (e) {
      print(e.toString());
    }
  }
}
