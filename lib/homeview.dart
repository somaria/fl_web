import 'package:fl_webview/sidedrawer.dart';
import "package:flutter/material.dart";

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PS SafeEntry"),
      ),
      drawer: SideDrawer(),
      body: Container(
        child: Text("At Home Page"),
      ),
    );
  }
}
