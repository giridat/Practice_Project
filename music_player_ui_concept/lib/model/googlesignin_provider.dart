import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  Future googleLogIn() async {
    final googleUserAccount = await googleSignIn.signIn();
    if (googleUserAccount == null) return;
    _user = googleUserAccount;
    final googleAuthenticate = await googleUserAccount.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuthenticate.accessToken,
      idToken: googleAuthenticate.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credentials);
    notifyListeners();

    Future googleLogOut() async {

    }
  }
}
