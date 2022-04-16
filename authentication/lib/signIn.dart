import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Future<UserCredential> signIn() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signOut() {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    print('user signed out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase 🔥🔥'),
        backgroundColor: Colors.black38,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: ElevatedButton(
                    onPressed: signIn,
                    child: const Text('SignIn with Google'))),
            Center(
                child: ElevatedButton(
                    onPressed: signOut, child: const Text('Sign out'))),
            Center(
                child: ElevatedButton(
                    onPressed: null, child: Text('SignIn with Facebook'))),
            // ignore: prefer_const_constructors
            Center(
                child: ElevatedButton(
                    onPressed: null, child: Text('SignIn with Github')))
          ],
        ),
      ),
    );
  }
}
