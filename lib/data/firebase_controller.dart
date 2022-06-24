import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  getUsers() {
    //get collection from firebase, collection is table in mysql
    CollectionReference users = firebase.collection('users');
    return users.get();
  }
}
