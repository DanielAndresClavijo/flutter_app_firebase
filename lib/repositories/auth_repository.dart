import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential?> signInWithEmail({
    required String phone,
    required String password,
  });
}

class AuthFirebase extends AuthRepository {
  UserCredential? userCredential;

  @override
  Future<UserCredential?> signInWithEmail({
    required String phone,
    required String password,
  }) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithCustomToken(
        phone,
      );
    } catch (e) {
      print(e.toString());
    }
    return userCredential;
  }
}
