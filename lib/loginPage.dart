import 'package:flutter/material.dart';
import 'registerPage.dart';
class LoginPage extends StatefulWidget {
  static String id = 'loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      margin: const EdgeInsets.only(left: 10, top: 30, right: 30),
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
                     const Card(
                      margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Input Mobile No',
                          labelText: 'Enter your Mobile No',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                      ),
                    ),
                    const  Card(
                      margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Input Password',
                          labelText: 'Enter your Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                      ),
                    ),
                    const   SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 30, top: 30, right: 30),
                      child: RaisedButton(
                        elevation: 10,
                        color: Colors.pinkAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(40))),
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
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
}

