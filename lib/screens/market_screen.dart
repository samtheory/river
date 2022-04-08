import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:river/routes/router.gr.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(child: Text('Market screen'))
    );
  }
}
