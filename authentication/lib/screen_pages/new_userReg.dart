import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';

String emailNew = "";
String pwdNew = "";

class NewUserReg extends StatefulWidget {
  const NewUserReg({Key? key}) : super(key: key);

  @override
  State<NewUserReg> createState() => _NewUserRegState();
}

class _NewUserRegState extends State<NewUserReg> {
  Future<void> signUp() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailNew, password: pwdNew);
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New User Registration'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
                onChanged: (value) => {emailNew = value},
                cursorColor: Colors.white24,
                style: TextStyle(color: Colors.white),
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
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
                onChanged: (value) => {pwdNew = value},
                style: TextStyle(color: Colors.white),
                obscureText: true,
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
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            // onTap: signUp,
            onTap: () => signUp()
                .whenComplete(() => showToast(
                    "Your new account has been created",
                    gravity: Toast.bottom,
                    duration: 7))
                .then((value) => Navigator.pop(context)),
            child: Container(
              child: Center(child: Text('Create')),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
