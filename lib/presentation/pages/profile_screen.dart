import 'package:flutter/material.dart';
import 'package:rpos/forms/profile_form.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: ProfileForm(),
        ),
      ),
    );
  }
}
