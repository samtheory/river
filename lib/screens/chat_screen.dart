import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:river/routes/router.gr.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Text('Chat screen'))
    );
  }
}
