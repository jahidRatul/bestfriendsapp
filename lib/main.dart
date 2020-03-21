import 'package:bestfriend/registerPage.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'loginPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bestFriend',
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (BuildContext context) => LoginPage(),
        RegisterPage.id: (BuildContext context) => RegisterPage(),
        HomePage.id: (BuildContext context) => HomePage(),
      },
    );
  }
}
