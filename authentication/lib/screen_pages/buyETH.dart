import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'addMoneypage.dart';

TextEditingController myControllereth = TextEditingController();

class ETH extends StatefulWidget {
  const ETH({Key? key}) : super(key: key);

  @override
  State<ETH> createState() => _ETHState();
}

class _ETHState extends State<ETH> {
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }

  Future<void> updateETH() async {
    mapdata["walletAmount"] -= int.parse(myControllereth.text);
    mapdata["ethAmount"] += int.parse(myControllereth.text);
    await documentReference.update(mapdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("ETH"),
          backgroundColor: Colors.black26,
        ),
        body: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
                keyboardType: TextInputType.number,
                controller: myControllereth,
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
            onTap: () =>
                mapdata["walletAmount"] >= int.parse(myControllereth.text)
                    ? updateETH()
                    : showToast("Insufficient Balance", gravity: Toast.bottom),

            // onTap: () => updateBTC()
            //     .whenComplete(() => showToast("Bitcoin is added",
            //         gravity: Toast.bottom, duration: 7))
            //     .then((value) => Navigator.pop(context)),
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
