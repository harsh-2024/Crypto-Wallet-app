import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Map<String, dynamic> mapdata = <String, dynamic>{
  "walletAmount": 0,
  "btcAmount": 0
};

TextEditingController myController = TextEditingController();
// String? uid = FirebaseAuth.instance.currentUser?.uid;
DocumentReference documentReference =
    FirebaseFirestore.instance.doc("myData/walletData");

class InputAmount extends StatefulWidget {
  const InputAmount({Key? key}) : super(key: key);

  @override
  State<InputAmount> createState() => _InputAmountState();
}

class _InputAmountState extends State<InputAmount> {
  Future<void> addMoney() async {
    // mapdata["walletAmount"] += int.parse(myController.text);
    documentReference
        .set(mapdata)
        .whenComplete(() => print("document added to firebase"));
  }

  Future<void> updateWalletMoney() async {
    mapdata["walletAmount"] += int.parse(myController.text);
    documentReference.update(mapdata);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                controller: myController,
                cursorColor: Colors.white24,
                keyboardType: TextInputType.number,
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
                    hintText: 'Enter amount to be added in wallet')),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => addMoney()
                  .whenComplete(() => updateWalletMoney())
                  .whenComplete(() => Navigator.pop(context)),
              child: Container(
                child: Center(child: Text('Add')),
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
      ),
    );
  }
}
