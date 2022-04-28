import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
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
                    ' ₹  --- ',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => null,
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
                  SizedBox(height: 50),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          child: InkWell(
                              onTap: () => print('BTC'),
                              splashColor: Colors.black45,
                              child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'BTC',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text('Invested: '),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Current: '),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(children: <Widget>[
                                        InkWell(
                                          onTap: () => null,
                                          child: Container(
                                            child: Center(child: Text('Buy')),
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () => null,
                                          child: Container(
                                            child: Center(child: Text('Sell')),
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
