import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/widgets/build_forecast_item.dart';
import 'package:weather_app/widgets/build_header.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BuildHeaderWidget(weatherModel: controller.weatherModel),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.weatherModel.forecast!.forecastday!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 25);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return BuildForecastItem(
                            forecastday: controller.weatherModel.forecast!.forecastday![index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
