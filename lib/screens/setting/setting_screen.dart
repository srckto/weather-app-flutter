import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        title: "Setting not available",
        fontSize: 30,
      ),
    );
  }
}
