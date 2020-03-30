import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static String id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAuth = false;
  var name;
  var pNumber;

  final uri = 'http://test.bestfriends.com.bd/api/mdshadhin';

  @override
  void initState() {
    _getUserInfo();

    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String userKey = localStorage.getString('accessKey');
    print("userkey is -> " + userKey);

    _setHeaders() => {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $userKey'
        };

    http.Response response = await http.get(
      uri,
      headers: _setHeaders(),
    );
    Map<String, dynamic> user = jsonDecode(response.body);
    print("Full Response body ->" + response.body);
    //  print("User name-> " + user['user']['name']);
    setState(() {
      name = user['user']['name'];
      pNumber = user['user']['mobile_no'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Friends Inc'),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      )),
      endDrawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('$name'),
            accountEmail: Text('$pNumber'),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 40),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      )),
      body: Container(),
    );
  }
}
