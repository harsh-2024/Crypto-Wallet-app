import 'dart:ui';
import 'package:authentication/screen_pages/new_userReg.dart';
import 'package:authentication/screen_pages/screen1.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen_pages/new_userReg.dart';

String email = "";
String pwd = "";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> userSignIn() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pwd);
  }

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

  Future<void> userSignUp() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pwd);
  }

  Future<void> forgotPassEmailLink() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Image(
                    image:
                        AssetImage('images/undraw_login_re_4vu2 1 (1).png'))),
            Text('lets\nstart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w200)),
            SizedBox(height: 20),
            TextFormField(
                onChanged: (value) => {email = value},
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white24,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade400),
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter email')),
            SizedBox(
              height: 15,
            ),
            TextFormField(
                onChanged: (value) => {pwd = value},
                obscureText: true,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white24,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade400),
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter your Password')),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Row(
              children: [
                InkWell(
                  onTap: () => userSignIn().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => Screen1())))),
                  child: Container(
                    child: Center(child: Text('Go')),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade500,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => forgotPassEmailLink(),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                SizedBox(width: 50),
                NewUserLink()
              ],
            )),
            SizedBox(height: 10),
            Divider(
              color: Colors.white54,
              endIndent: 30,
              indent: 30,
            ),
            SizedBox(
              height: 120,
            ),
            // GoogleButton()
            Center(
              child: InkWell(
                onTap: () => signIn().then((value) => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Screen1())))),
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade500),
                  height: 40,
                  width: 200,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.asset(
                          'images/ggl (1).png',
                          scale: 8,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Sign In with Google',
                          style: TextStyle(color: Colors.black),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewUserLink extends StatelessWidget {
  const NewUserLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewUserReg())),
      child: Text(
        'New User',
        style: TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
