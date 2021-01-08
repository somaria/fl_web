import 'package:fl_webview/sidedrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:dio/dio.dart';

class ScanCode extends StatefulWidget {
  @override
  _ScanCodeState createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  String _scanBarcode = 'ABCD1234';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(title: const Text('Barcode scan')),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => scanBarcodeNormal(),
                      child: Text("Start barcode scan"),
                    ),
                    Text('Scan result : $_scanBarcode\n',
                        style: TextStyle(fontSize: 20)),
                    RaisedButton(
                      onPressed: () => addQrCode(),
                      child: Text("Update User Info"),
                    ),
                  ]));
        }));
  }

  void addQrCode() async {
    print("updating token");
    var dio = Dio();
    try {
      // Response response = await dio.get('http://10.0.2.2:4000/safelogin');
      Response response = await dio.post('http://localhost:4000/addqrcode');
      // print(response.data);
      // Map result = response.data;
      // print(result['message']);
    } catch (e) {}
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
}
