import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  getUsers() {
    //get collection from firebase, collection is table in mysql
    CollectionReference users = firebase.collection('users');
    return users.get();
  }

  addUser(Map<String, Object> data) {
    CollectionReference users = firebase.collection('users');
    users.add(data);
  }

  updateUser({required String uuid, Map<String, Object?>? data}) {
    CollectionReference users = firebase.collection('users');
    users.doc(uuid).update(data ?? {});
  }

  deleteUser(String uuid) {
    CollectionReference users = firebase.collection('users');
    users.doc(uuid).delete();
  }
}
