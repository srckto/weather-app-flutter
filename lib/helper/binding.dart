import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/controllers/layout_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayOutController());
    Get.lazyPut(() => HomeController());
  }
}
