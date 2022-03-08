


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_text.dart';

class BuildHeaderWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  const BuildHeaderWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 130,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  title: weatherModel.location!.country!,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 2),
                CustomText(
                  title: weatherModel.location!.region!,
                ),
                SizedBox(height: 2),
                CustomText(
                  title: weatherModel.location!.localtime!.split(" ").first +
                      "  " +
                      DateFormat("EEEE").format(DateTime.now()),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image.network(
                  "https:" + weatherModel.current!.condition!.icon!,
                  color: weatherModel.current!.isDay == 1 ? Colors.orange : Colors.black,
                ),
                Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: weatherModel.current!.tempC!.toString() + "º",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: " " + weatherModel.current!.condition!.text!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
