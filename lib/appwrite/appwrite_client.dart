import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appWriteClient = Provider<Client>((ref) {
  Client client = Client();
  client
      .setEndpoint('http://192.168.1.101:1010/v1') // Your Appwrite Endpoint
      .setProject('625d05a4d92c8bd0d5f4') // Your project ID
      .setSelfSigned(
        status: true,
      ); // For self signed certificates, only use for development
  return client;
});

