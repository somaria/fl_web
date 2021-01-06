import 'package:fl_webview/main.dart';
import 'package:fl_webview/sidedrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class Retrieve extends StatefulWidget {
  @override
  _RetrieveState createState() => _RetrieveState();
}

class _RetrieveState extends State<Retrieve> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Retrieve",
      home: RetrieveInfo(),
    );
  }
}

class RetrieveInfo extends StatelessWidget {
  const RetrieveInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Retrieve",
        ),
      ),
      body: RunRetrieve(),
    );
  }
}

class RunRetrieve extends StatefulWidget {
  @override
  _RunRetrieveState createState() => _RunRetrieveState();
}

class _RunRetrieveState extends State<RunRetrieve> {
  openWeb() async {
    await FlutterWebBrowser.openWebPage(url: "http://localhost:3000/");
  }

  @override
  void initState() {
    super.initState();
    openWeb();
    print("view will show");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Disposing page");
  }

  @override
  Widget build(BuildContext context) {
    print("view will build");
    return Container(
      child: Column(children: <Widget>[
        Expanded(
          child: Container(
            child: Text("Retrieve My Info"),
            // child: InAppWebView(
            //   initialUrl: "http://192.168.1.74:3000/",
            // ),
          ),
        ),
      ]),
    );
  }
}
