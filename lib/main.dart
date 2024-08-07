import 'package:flutter/material.dart';
import 'package:rpos/presentation/pages/home_screen.dart';
import 'package:rpos/presentation/pages/login_screen.dart';
import 'package:rpos/presentation/pages/main_screen.dart';
import 'package:rpos/presentation/pages/profile_screen.dart';
import 'package:rpos/presentation/pages/order_screen.dart';

void main () => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPOS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      routes: {
        'login': (_) => const LoginScreen(),
        'navbar': (_) => const MainScreen(),
        'home': (_) => const HomeScreen(),
        'promotions': (_) => const OrderScreen(),
        'profile': (_) => const ProfileScreen()
      },
      initialRoute: 'login',
    );
  }
}