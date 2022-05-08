import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:river/appwrite/appwrite_client.dart';
import 'package:river/main.dart';
import 'package:river/routes/router.gr.dart';


class TestFunctionScreen extends HookConsumerWidget {
  const TestFunctionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Account account = ref.watch(accountProvider);
    Database database = ref.watch(databaseProvider);
    AppWriteServices _services =
        AppWriteServices(account: account, db: database);
    final data = useState([]);
    return Scaffold(
      backgroundColor: cWhite,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('hellow world'),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await account.create(
                          userId: 'unique()',
                          email: 'me@appwrite.io',
                          password: 'password',
                          name: 'My Name');
                    } catch (e) {
                      throw e;
                    }
                  },
                  child: const Text('create User')),
              ElevatedButton(
                  onPressed: () {
                    account
                        .createSession(
                          email: 'me@appwrite.io',
                          password: 'password',
                        )
                        .then((response) => print(response))
                        .catchError((error) => print(error.response));
                  },
                  child: Text('login')),
              ElevatedButton(
                  onPressed: () {
                    database
                        .listDocuments(
                          collectionId: 'alaki001',
                        )
                        .then((value) => print(value.documents))
                        .catchError((error) => print(error.response));
                  },
                  child: Text('Get document List')),
              ElevatedButton(
                  onPressed: () {
                    database
                        .createDocument(
                          collectionId: 'alaki001',
                          documentId: 'unique()',
                          data: {'1000': 200, 'text': "she lived in paradice"},
                        )
                        .then((value) => print(value))
                        .catchError((error) => print(error.response));
                  },
                  child: Text('Get User')),
              ElevatedButton(
                  onPressed: () {
                    account.get().then((User response) {
                      print(response.$id);
                    }).catchError((error) {
                      print(error.response);
                    });
                  },
                  child: Text('create Document')),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.red)),
                  onPressed: () {
                    _services.updateDocument();
                  },
                  child: Text('custom Function'))
            ]),
      ),
    );
  }
}

class AppWriteServices {
  Account account;
  Database db;
  AppWriteServices({
    required this.account,
    required this.db,
  });

  /// get the userData
  getAccount() {
    account
        .get()
        .then((User user) => print(user.email))
        .catchError((e) => print(e));
  }

  createDocument() {
    db
        .createDocument(
          collectionId: '625d0cba1cc5ff839bf7',
          documentId: 'unique()',
          data: {
            'hi': 'end of the world',
            'data': ['ali', 'mamad']
          },
        )
        .then((value) => print(value))
        .catchError((e) => print(e));
  }

  listDocument() {
    db
        .listDocuments(
          collectionId: '625d0cba1cc5ff839bf7',
        )
        .then((value) => print(value.documents))
        .catchError((e) => print(e));
  }

  updateDocument() {
    db
        .updateDocument(
          collectionId: '625d0cba1cc5ff839bf7',
          documentId: '627139dc3ff0ed133738',
          data: {'bad': 'fucked up shit'},
        )
        .then((value) => print(value))
        .catchError((e) => print(e));
  }
}
