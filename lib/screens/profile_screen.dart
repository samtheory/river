import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:river/routes/router.gr.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Text('Profile screen'),
      ),
    );
  }
}
