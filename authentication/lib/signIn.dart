import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  DocumentReference documentReference =
      FirebaseFirestore.instance.doc("myData/dummyData");
  void _add() {
    Map<String, String> data = <String, String>{
      "name": "Harsh Tripathi",
      "company": "FRE",
      "projects": "2",
      "add": "Jhansi"
    };
    documentReference.set(data).whenComplete(() => print('document added'));
  }

  // String dataFetched = "";
  Map dataFromBackend = {
    "name": "loading...",
    "company": "loading...",
    "projects": "loading...",
    "add": "loading..."
  };

  void fetch() {
    documentReference
        .get()
        .whenComplete(() => print('document fetched!'))
        .then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          dataFromBackend = datasnapshot.data() as Map;
        });

        // print(datasnapshot.data());

        print(dataFromBackend);
      } else {
        print('document is empty');
        dataFromBackend["name"] = "unknown";
      }
    });
  }

  // late StreamSubscription<DocumentReference> subscription;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   subscription = documentReference.snapshots().listen((datasnapshot) {
  //     if (datasnapshot.exists) {
  //       setState(() {
  //         dataFromBackend = datasnapshot.data() as Map;
  //       });
  //     }
  //   }) as StreamSubscription<DocumentReference<Object?>>;
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   subscription.cancel();
  // }

  void update() {
    Map<String, String> updatedData = <String, String>{
      "name": "Ansh Tripathi",
      "company": "JPMC",
      "projects": "4",
      "add": "Jhansi"
    };
    documentReference
        .update(updatedData)
        .whenComplete(() => print("document updated"));
  }

  void _delete() {
    documentReference.delete().whenComplete(() => print('document deleted'));
  }

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase FireStore🔥🔥'),
        backgroundColor: Colors.black38,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: ElevatedButton(
                    onPressed: signIn, child: const Text('SignIn'))),
            Center(
                child: ElevatedButton(
                    onPressed: signOut, child: const Text('Sign out'))),
            Center(
                child:
                    ElevatedButton(onPressed: _add, child: Text('Add Data'))),
            // ignore: prefer_const_constructors
            Center(
                child: ElevatedButton(
                    onPressed: fetch, child: Text('Fetch Data'))),
            Center(
                child: ElevatedButton(
                    onPressed: update, child: Text('Update Data'))),
            Center(
                child: ElevatedButton(
              onPressed: _delete,
              child: Text('Delete Data'),
            )),
            // ignore: unnecessary_null_comparison
            // dataFetched == null
            //     ? Container()
            //     : Text("$dataFetched.data!['name']")
            // Text(dataFromBackend['name'])
            // dataFromBackend == {}
            //     ? Container(
            //         child: Text('document is empty'),
            //       )
            //     : Text(dataFromBackend['name'])
            // Text(
            //   dataFromBackend['name'],
            //   style: TextStyle(fontSize: 20),
            // ),
            // Text(dataFromBackend['add']),
            // dataFromBackend == null ? Text('Data is empty') : Text("")
            dataFromBackend["name"] == "unknown"
                ? Text("Database Empty")
                : Text(dataFromBackend["name"])
          ],
        ),
      ),
    );
  }
}
