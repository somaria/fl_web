import 'dart:async';
import 'package:fl_webview/retrieve.dart';
import 'package:fl_webview/sidedrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InAppWebViewPage());
  }
}

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SafeEntry"),),
      drawer: SideDrawer(),
      body: Container(
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: InAppWebView(
                initialUrl: "https://musing-borg-8fb7f1.netlify.app/",
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
