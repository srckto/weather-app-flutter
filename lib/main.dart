import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/helper/binding.dart';
import 'package:weather_app/screens/layout_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.cairo().fontFamily,
      ),
      initialBinding: Binding(),
      home: const LayOutScreen(),
    );
  }
}
