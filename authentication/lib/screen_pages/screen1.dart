import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addMoneypage.dart';
import 'package:toast/toast.dart';

int addedAmount = 0;

Map<dynamic, dynamic> fetchedData = <String, dynamic>{
  "walletAmount": 0,
  "btcAmount": 0
};

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }

  void fetchWalletAmount() async {
    await documentReference.get().then((datasnapshot) => {
          addedAmount = fetchedData["walletAmount"],
          if (datasnapshot.exists)
            {
              setState(() => {fetchedData = datasnapshot.data() as Map})
            }
          else
            {fetchedData["name"] = "unknown"}
        });
    print(fetchedData["walletAmount"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Card(
            margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
            color: Colors.white10,
            child: SizedBox(
              height: 400,
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ' Your Wallet ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    ' ₹$addedAmount',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InputAmount()))
                            .whenComplete(() => showToast(
                                "Money Added to Wallet",
                                gravity: Toast.bottom,
                                duration: 5)),
                        child: Container(
                          child: Center(child: Text('Add Money')),
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      InkWell(
                        onTap: () => fetchWalletAmount(),
                        child: Container(
                          child: Center(child: Text('Check Balance')),
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ));
  }
}
