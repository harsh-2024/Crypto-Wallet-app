import 'dart:ui';
import 'package:flutter/material.dart';

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
            margin: EdgeInsets.only(left: 20, top: 20),
            color: Colors.white10,
            child: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Amount ',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    'Invested ',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    '   --- ',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Row(
                    children: <Widget>[
                      Card(
                        child: InkWell(
                            onTap: () => print('BTC'),
                            splashColor: Colors.black45,
                            child: SizedBox(
                              height: 30,
                              width: 50,
                              child: Center(child: Text('BTC')),
                            )),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Card(
                        child: InkWell(
                            onTap: () => print('BTC'),
                            splashColor: Colors.black45,
                            child: SizedBox(
                              height: 30,
                              width: 50,
                              child: Center(child: Text('ETH')),
                            )),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Card(
                        child: InkWell(
                            onTap: () => print('BTC'),
                            splashColor: Colors.black45,
                            child: SizedBox(
                              height: 30,
                              width: 50,
                              child: Center(child: Text('SOL')),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
