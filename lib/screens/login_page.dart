import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttersampleui/styles/main_style.dart';
import 'package:fluttersampleui/components/acwRoundedButton.dart';
import 'package:fluttersampleui/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                textAlign: TextAlign.center,
                decoration: myTextFieldDecorationLight.copyWith(
                  hintText: 'Enter Username',
                ),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: myTextFieldDecorationLight.copyWith(
                  hintText: 'Enter Password',
                ),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              AcwRoundedButton(
                color: Colors.lightBlue,
                title: 'LOGIN',
                onPressed: () async {
                  print('LOGIN button click');
                },
              ),
              AcwRoundedButton(
                color: Colors.black26,
                title: 'REGISTER NOW',
                onPressed: () async {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
              ),
            ],
          )),
    );
  }
}
