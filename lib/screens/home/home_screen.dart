import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/constant.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/widgets/build_header.dart';
import 'package:weather_app/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildHeaderWidget(
                        weatherModel: controller.weatherModel,
                      ),
                      SizedBox(height: 15),
                      CustomText(
                        title: "More Details",
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      _buildItem(
                        title: "Wind speed",
                        detail: controller.weatherModel.current!.windKph!.toString() + " Kph",
                      ),
                      SizedBox(height: 10),
                      _buildItem(
                        title: "Wind degree",
                        detail: controller.weatherModel.current!.windDegree!.toString() + "°",
                      ),
                      SizedBox(height: 10),
                      _buildItem(
                        title: "Wind direction",
                        detail: controller.weatherModel.current!.windDir!,
                      ),
                      SizedBox(height: 10),
                      _buildItem(
                        title: "Pressure",
                        detail:
                            controller.weatherModel.current!.pressureMb!.toString() + " millibars",
                      ),
                      SizedBox(height: 10),
                      _buildItem(
                        title: "Cloud",
                        detail: controller.weatherModel.current!.cloud!.toString() + "%",
                      ),
                      SizedBox(height: 10),
                      _buildItem(
                        title: "Uv index",
                        detail: controller.weatherModel.current!.uv!.toString(),
                      ),
                      SizedBox(height: 10),
                      _buildItem(
                        title: "Wind gust",
                        detail: controller.weatherModel.current!.gustKph!.toString() + " Kph",
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class _buildItem extends StatelessWidget {
  final String title;
  final String detail;
  const _buildItem({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: k_thirdColor.withOpacity(0.4),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              title: title,
              color: Colors.white,
              fontSize: 18,
            ),
            CustomText(
              title: detail,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
