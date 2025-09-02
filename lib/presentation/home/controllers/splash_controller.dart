import 'package:get/get.dart';

class SplashController extends GetxController {
  var step = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _animateSplash();
  }

  void _animateSplash() async {
    await Future.delayed(Duration(milliseconds: 900));
    step.value = 1;
    await Future.delayed(Duration(milliseconds: 1000));
    step.value = 2;
    await Future.delayed(Duration(milliseconds: 900));
    Get.offNamed('/home');
  }
}
