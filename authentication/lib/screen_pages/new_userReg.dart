import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          TextFormField(
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
          SizedBox(
            height: 15,
          ),
          TextFormField(
              onChanged: (value) => {pwdNew = value},
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
            height: 10,
          ),
          InkWell(
            onTap: signUp,
            child: Container(
              child: Center(child: Text('Go')),
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

// class Button extends StatelessWidget {
//   const Button({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: ,
//       child: Container(
//         child: Center(child: Text('Go')),
//         height: 40,
//         width: 100,
//         decoration: BoxDecoration(
//           color: Colors.blue.shade500,
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }
// }
