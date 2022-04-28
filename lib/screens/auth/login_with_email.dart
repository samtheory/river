import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class   LoginWithEmailAndPassScreen extends HookConsumerWidget {
  const LoginWithEmailAndPassScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('E-mail')),
              )
            ],
          ))
        ],
      )),
    );
  }
}
