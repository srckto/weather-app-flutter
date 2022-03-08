import 'package:flutter/material.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/controllers/layout_controller.dart';
import 'package:get/get.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            k_primeryColor,
            k_secondColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: GetBuilder<LayOutController>(
            init: LayOutController(),
            builder: (controller) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: IndexedStack(
                  index: controller.index,
                  children: controller.list.map((e) => e.screen).toList(),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  selectedItemColor: k_fourthColor,
                  unselectedItemColor: Colors.transparent,
                  currentIndex: controller.index,
                  onTap: controller.onChange,
                  items: controller.list
                      .map(
                        (element) => BottomNavigationBarItem(
                          icon: Image.asset(
                            element.imagePath,
                            width: 30,
                            height: 30,
                            color: k_fourthColor,
                          ),
                          label: element.title,
                        ),
                      )
                      .toList(),
                ),
              );
            }),
      ),
    );
  }
}
