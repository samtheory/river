import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river/appwrite/appwrite_client.dart';
import 'package:river/routes/router.gr.dart';

final accountProvider = Provider<Account>((ref) {
  Client client = ref.watch(appWriteClient);
  Account account = Account(client);
  return account;
});

final databaseProvider = Provider<Database>((ref) {
  Client client = ref.watch(appWriteClient);
  Database _db = Database(client);
  return _db;
});

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Account account = ref.watch(accountProvider);
    Database database = ref.watch(databaseProvider);
    final data = useState([]);
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  child: Text('create Document'))
            ]),
      ),
    );
  }
}
