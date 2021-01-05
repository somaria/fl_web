import 'package:fl_webview/scancode.dart';
import 'package:flutter/material.dart';
import 'retrieve.dart';
import "homeview.dart";

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('PS SafeEntry'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Scan Code'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanCode(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('RetrieveMyInfo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Retrieve(),
                ),
              );
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
