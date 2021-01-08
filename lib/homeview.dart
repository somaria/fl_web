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
  var user = "";

  var dio = Dio();

  void getUser() async {
    try {
      // Response response = await dio.get('http://localhost:3001/getuser2');
      Response response = await dio.get('http://localhost:4000/lastuser');
      print(response.data);
      Map result = response.data;
      print(result['user']);
      setState(() {
        user = result['user'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("In Safe Entry Home");
    getUser();
  }

  void checkIn() async {
    try {
      // var dio = Dio();
      // Response response = await dio.get('http://10.0.2.2:4000/safelogin');
      Response response = await dio.get('http://localhost:4000/safelogin');
      print(response.data);
      Map result = response.data;
      print(result['message']);
      setState(() {
        message = result['message'];
      });
    } catch (e) {}
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
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Text(
              user,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 24),
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
            height: 24,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
