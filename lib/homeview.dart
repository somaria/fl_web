import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fl_webview/sidedrawer.dart';
import "package:flutter/material.dart";

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("In Safe Entry Home");
  }

  void checkIn() async {
    var dio = Dio();
    Response response = await dio.get('http://10.0.2.2:4000/safelogin/1');
    print(response.data);
    Map result = response.data;
    print(result['message']);
    setState(() {
      message = result['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PS SafeEntry"),
      ),
      drawer: SideDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 64, left: 64),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0)),
              color: Colors.blue[100],
              onPressed: () {
                print("Checking in");
                checkIn();
              },
              child: const Text(
                'Safe Entry Checkin',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
