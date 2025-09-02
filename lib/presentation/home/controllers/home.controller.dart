import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final steps = RxInt(0);
  final calories = RxDouble(0.0);
  late Health health;

  @override
  void onInit() {
    super.onInit();
    health = Health();
    fetchGoogleFitData();
  }

  Future<void> fetchGoogleFitData() async {
    final types = [HealthDataType.STEPS, HealthDataType.ACTIVE_ENERGY_BURNED];
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool authorized = await health.requestAuthorization(types);

    if (authorized) {
      // Fetch steps
      List<HealthDataPoint> stepsData = await health.getHealthDataFromTypes(
        types: [HealthDataType.STEPS],
        startTime: midnight,
        endTime: now,
      );

      int todaySteps = stepsData.fold<int>(
        0,
        (sum, point) => sum + (point.value is int ? point.value as int : 0),
      );

      // Fetch calories
      List<HealthDataPoint> caloriesData = await health.getHealthDataFromTypes(
        types: [HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: midnight,
        endTime: now,
      );

      double todayCalories = caloriesData.fold<double>(
        0.0,
        (sum, point) =>
            sum + (point.value is double ? point.value as double : 0.0),
      );

      steps.value = todaySteps;
      calories.value = todayCalories;
    } else {
      Get.snackbar(
        'Permission',
        'Access to health data was denied',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
