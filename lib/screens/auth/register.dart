import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:river/appwrite/appwrite_client.dart';
import 'package:river/constants/constant.dart';
import 'package:river/gen/assets.gen.dart';
import 'package:river/routes/router.gr.dart';
import 'package:river/screens/get_started_screen.dart';
import 'package:river/screens/profile_screen.dart';

class RegisterScreen extends HookConsumerWidget {
  RegisterScreen({Key? key}) : super(key: key);
  Map<String, String> _object = {'email': '', 'password': '', 'username': ''};
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Account account = ref.watch(accountProvider);
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        toolbarTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: cWhite,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text('please complete the following requirment'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (value) {
                              _object.update('email', (_) => value ?? '');
                            },
                            decoration: InputDecoration(
                                icon: LineIcon.envelope(),
                                hintText: 'example@gmail.com'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onSaved: (value) {
                              _object.update('password', (_) => value ?? '');
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: LineIcon.lock(), hintText: 'password'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onSaved: (value) {
                              _object.update('username', (_) => value ?? '');
                            },
                            decoration: InputDecoration(
                                icon: LineIcon.user(), hintText: 'Username'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [ElevatedButton(onPressed: (){
                        account.get().then((User response) {
                                  print( response.email);
                                }).catchError((error) {
                                  print(error.response);
                                  
                                });
                      }, child: Text('getUser')),
                        GradientButton(
                          onTap: () async {
                            _formKey.currentState?.save();
                            print(_object);

                            await account
                                .create(
                                    userId: 'unique()',
                                    email: _object['email']!,
                                    password: _object['password']!,
                                    name: _object['username']!)
                                .then((response) => print(response))
                                .catchError((error) => print(error.response));

                            account
                                .createSession(
                              email: _object['email']!,
                              password: _object['password']!,
                            )
                                .then((response) {
                              print(response);
                              AutoRouter.of(context)
                                  .push(HomeBottomNavigationRoute());
                            }).catchError((error) => print(error.response));
                            // AutoRouter.of(context).push(const RegisterRoute());
                          },
                          gradient: KGradiant.blue,
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: const Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: cWhite, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            const Text('Already have an account? '),
                            TextButton(
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(const LoginWithEmailAndPassRoute());
                                },
                                child: const Text('Signin'))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
