import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/Pages/Auth/login.dart';

Future<void> addUser(String email, String password, String username) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    String uid = userCredential.user!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'uid': uid,
      'email': email,
      'password': password,
      'createdAt': DateTime.now().toIso8601String(),
      'isLoggedIn': false
    });
  } catch (e) {
    print("Error on : $e");
  }
}

Future<Map<String, dynamic>?> redirectUser(String uid) async {
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if(doc.exists) {
      return doc.data() as Map<String, dynamic>;
    } else {
      print('User Not Found');
      return null;
    }
  } catch (e) {
    print('Error on : $e');
    return null;
  }
}