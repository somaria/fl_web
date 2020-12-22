import 'package:fl_webview/main.dart';
import 'package:fl_webview/sidedrawer.dart';
import 'package:flutter/material.dart';

class Retrieve extends StatefulWidget {
  @override
  _RetrieveState createState() => _RetrieveState();
}

class _RetrieveState extends State<Retrieve> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Retrieve",
      home: Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Retrieve",
          ),
        ),

      ),

    );
  }
}
