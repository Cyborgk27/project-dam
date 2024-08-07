import 'package:flutter/material.dart';
import 'package:rpos/presentation/pages/widgets/category_list.dart';
import 'package:rpos/presentation/pages/widgets/restaurant_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RestaurantSlider(),
            Expanded(child: CategoryList()),
            
          ],
        ),
      ),
    );
  }
}