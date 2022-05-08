import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'addMoneypage.dart';

TextEditingController myControllerbtc = TextEditingController();

class BTC extends StatefulWidget {
  const BTC({Key? key}) : super(key: key);

  @override
  State<BTC> createState() => _BTCState();
}

class _BTCState extends State<BTC> {
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }

  Future<void> updateBTC() async {
    mapdata["walletAmount"] -= int.parse(myControllerbtc.text);
    mapdata["btcAmount"] += int.parse(myControllerbtc.text);
    documentReference.update(mapdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("BTC"),
          backgroundColor: Colors.black26,
        ),
        body: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
                keyboardType: TextInputType.number,
                controller: myControllerbtc,
                onChanged: (value) => {},
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
                    hintText: 'Enter amount')),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            // onTap: mapdata["walletAmount"]>=myControllerbtc.text ? updateBTC() : showToast("Insufficient Balance", gravity: Toast.bottom);

            onTap: () => updateBTC()
                .whenComplete(() => showToast("Bitcoin is added",
                    gravity: Toast.bottom, duration: 7))
                .then((value) => Navigator.pop(context)),
            child: Container(
              child: Center(child: Text('Buy')),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ]));
  }
}
