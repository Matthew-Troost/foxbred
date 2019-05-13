import 'package:cloud_firestore/cloud_firestore.dart';

DocumentReference addUser(String uuid, String name, String surname, String email) {
  DocumentReference user;
  Firestore.instance.runTransaction((Transaction transaction) async {
    user = await Firestore.instance.collection("users").add({"name": name});
  });
  return user;
}
