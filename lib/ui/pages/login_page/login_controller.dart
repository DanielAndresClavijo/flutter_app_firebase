import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app_firebase/model/person.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Person? currentUser;

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool isOkInfoLogin() {
    return phoneController.text.length >= 8 &&
        passwordController.text.length >= 8;
  }

  Future<bool> signIn() async {
    /// Contiene los resultados de consultar el usuario del login.
    QuerySnapshot result = await _firestore
        .collection('person')
        .where('phone',
            isEqualTo: phoneController.text.split(" ").join().trim())
        .get();
    print("result: ${result}");

    if (result.docs.isEmpty) {
      /// No se encontraron documentos coincidentes
      return false;
    }

    DocumentSnapshot user = result.docs[0];

    // Check the password
    if (user['pass'] == passwordController.text) {
      currentUser = Person(
        id: DateTime.now().millisecondsSinceEpoch,
        phone: phoneController.text,
        pass: passwordController.text,
      );

      return true;
    } else {
      //userRepository.setUser(userToSave);
      return false;
    }
  }
}
