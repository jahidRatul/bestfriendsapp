import 'dart:convert';

import 'package:bestfriend/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static String id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userData;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userKey = localStorage.getString('accessKey');

    setState(() {
      userData = userKey;
    });
  }

  @override
  Widget build(BuildContext context) {
//      var key = this._showToken().toString();
    return ListView(
      children: <Widget>[
        Card(
          child: Text(
            userData != null ? "Access token ->" + userData : '',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFF9b9b9b),
              fontSize: 15.0,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

//  String _showToken() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var accessKey = prefs.getString('accessKey');
//    print("from home ->" + accessKey);
//    return accessKey;
//  }
}
