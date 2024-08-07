import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rpos/data/models/restaurant.dart';

class RestaurantSlider extends StatefulWidget {
  const RestaurantSlider({super.key});

  @override
  State<RestaurantSlider> createState() => _RestaurantSliderState();
}

class _RestaurantSliderState extends State<RestaurantSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  List<Restaurant> _restaurants = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _loadRestaurants();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadRestaurants() async {
    final String response = await rootBundle.loadString('assets/restaurants.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      _restaurants = data.map((json) => Restaurant.fromJson(json)).toList();
    });
  }

  void _startAutoSlide() {
    Timer.periodic(const Duration(seconds: 20), (Timer timer) {
      if (_currentPage < (_restaurants.length - 1)) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _restaurants.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 200.0, // Ajusta la altura según sea necesario
            child: PageView.builder(
              controller: _pageController,
              itemCount: _restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = _restaurants[index];
                return RestaurantCard(restaurant: restaurant);
              },
            ),
          );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: [
          Image.network(
            restaurant.urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                restaurant.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
