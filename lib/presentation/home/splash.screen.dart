import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        Widget content;
        if (controller.step.value == 0) {
          content = Center(child: _BoozinDot());
        } else if (controller.step.value == 1) {
          content = Center(child: _BoozinLogo(context));
        } else {
          content = Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _BoozinLogo(context),
                SizedBox(height: 8),
                Text(
                  "Fitness",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        }
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: content,
        );
      }),
    );
  }
}

Widget _BoozinDot() {
  return Image.asset('assets/images/boozin_dot.png', width: 200, height: 80);
}

Widget _BoozinLogo(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return isDarkMode ? _NightBoozinLogo() : _DayBoozinLogo();
}

Widget _DayBoozinLogo() {
  return Image.asset('assets/images/boozin_logo.png', width: 200, height: 80);
}

Widget _NightBoozinLogo() {
  return Image.asset('assets/images/night_logo.png', width: 200, height: 80);
}
