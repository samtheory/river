import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:river/routes/router.gr.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: ElevatedButton(
        onPressed: () {
          // context.router.push(BookChildRoute());
        },
        child: Center(child: Text('Setting')),
      ),
    );
  }
}
