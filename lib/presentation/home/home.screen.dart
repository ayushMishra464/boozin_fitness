import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi!",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _StepsCard(),
              const SizedBox(height: 18),
              _CaloriesCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepsCard extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Obx(() {
                final steps = controller.steps.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: "Steps: "),
                          TextSpan(
                            text: steps.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (steps / 15000).clamp(0.0, 1.0),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.surfaceVariant,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('0'), Text('Goal: 15,000')],
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(width: 16),
            Icon(
              Icons.directions_walk,
              size: 48,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}

class _CaloriesCard extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Obx(() {
                final calories = controller.calories.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: "Calories Burned:  "),
                          TextSpan(
                            text: calories.toStringAsFixed(0),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (calories / 1000).clamp(0.0, 1.0),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.surfaceVariant,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('0'), Text('Goal: 1000')],
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Icon(
                  Icons.local_fire_department,
                  size: 40,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 4),
                Text(
                  "KCAL",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
