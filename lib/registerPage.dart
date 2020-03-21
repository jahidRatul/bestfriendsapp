import 'package:bestfriend/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'homePage.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'registerPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  bool _isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
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
                            ' Register ',
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
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Input Name',
                          labelText: 'Enter your Name',
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
                        controller: mobileController,
                        decoration: InputDecoration(
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
                        controller: passwordController,
                        decoration: InputDecoration(
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
                    Card(
                      margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: passwordConfirmController,
                        decoration: InputDecoration(
                          hintText: 'Input Password Again',
                          labelText: 'Enter your Password Again',
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
                        onPressed: _register,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    final uri = 'http://test.bestfriends.com.bd/api/register';
    var map = new Map<String, dynamic>();
    map['name'] = nameController.text;
    map['mobile_no'] = mobileController.text;
    map['password'] = passwordController.text;
    map['password_confirmation'] = passwordConfirmController.text;

    http.Response response = await http.post(
      uri,
      body: map,
    );
    print(response.body.toString());

    Navigator.pushNamed(context, LoginPage.id);

    setState(() {
      _isLoading = false;
    });
  }
}
