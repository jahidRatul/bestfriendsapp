import 'package:flutter/material.dart';
import 'registerPage.dart';
import 'homePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String id = 'loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 30, right: 30),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Image.asset('images/bflogop.png'),
                            height: 80.0,
                          ),
                          Text(
                            ' Login ',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: mobileController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                          ),
                          hintText: 'Input Mobile No',
                          labelText: 'Enter your Mobile No',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Color(0xFF9b9b9b),
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          hintText: 'Input Password',
                          labelText: 'Enter your Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      child: RaisedButton(
                        elevation: 10,
                        color: Colors.pinkAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        onPressed: _isLoading ? null : _login,
                        child: Text(
                          _isLoading ? 'Logging...' : 'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        disabledColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Don\'t have account? '),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterPage.id);
                          },
                          child: const Text('Sign Up'),
                          textColor: Colors.deepPurple,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    final uri = 'http://test.bestfriends.com.bd/api/login';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var map = new Map<String, dynamic>();

    map['mobile_no'] = mobileController.text;
    map['password'] = passwordController.text;

    http.Response response = await http.post(
      uri,
      body: map,
    );
    Map<String, dynamic> user = jsonDecode(response.body);
//    print(response.body);
//    print("access token -> " + user['access_token']);

    prefs.setString("accessKey", user['access_token']);

    Navigator.pushNamed(context, HomePage.id);

    setState(() {
      _isLoading = false;
    });
  }
}
