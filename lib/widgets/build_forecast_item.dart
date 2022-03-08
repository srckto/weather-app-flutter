



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_text.dart';

import '../constant.dart';

class BuildForecastItem extends StatelessWidget {
  final Forecastday forecastday;
  const BuildForecastItem({
    Key? key,
    required this.forecastday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomText(
                title: forecastday.date! +
                    "  " +
                    DateFormat("EEEE").format(
                      DateTime.parse(
                        forecastday.date!,
                      ),
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Condition",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.day!.condition!.text!.toString(),
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Max Temperature",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.day!.maxtempC!.toString() + " ℃",
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Min Temperature",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.day!.mintempC!.toString() + " ℃",
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Avarage Temperature",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.day!.avgtempC!.toString() + " ℃",
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Average Humidity",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.day!.avghumidity!.toString() + "%",
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Maximum Wind Speed",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.day!.maxwindKph!.toString() + " Kph",
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Total precipitation",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.day!.totalprecipMm!.toString() + " mm",
                  color: Colors.white,
                ),
              ],
            ),
            Divider(
              thickness: 3,
              color: Colors.black.withOpacity(0.3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Sunrise time",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.astro!.sunrise!,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Sunset time",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.astro!.sunset!,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Moonrise time",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.astro!.moonrise!,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Moonset time",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.astro!.moonset!,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Moon phases",
                  color: Colors.white,
                  fontSize: 18,
                ),
                CustomText(
                  title: forecastday.astro!.moonPhase!,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
