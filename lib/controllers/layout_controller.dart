import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/forecast/forecast_screen.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/screens/setting/setting_screen.dart';

class _item {
  final String title;
  final String imagePath;
  final Widget screen;
  _item({
    required this.title,
    required this.imagePath,
    required this.screen,
  });
}

class LayOutController extends GetxController {
  int index = 0;
  List<_item> list = [
    _item(title: "Home", imagePath: "assets/images/home.png", screen: HomeScreen()),
    _item(title: "ForeCast", imagePath: "assets/images/rain.png", screen: ForecastScreen()),
    _item(title: "Setting", imagePath: "assets/images/settings.png", screen: SettingScreen()),
  ];

  void onChange(int newIndex) {
    index = newIndex;
    update();
  }
}
