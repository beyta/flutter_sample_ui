import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttersampleui/styles/main_style.dart';
import 'package:fluttersampleui/components/acwRoundedButton.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'RegisterPage';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              Text(
                'Name : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: myTextFieldDecorationLight.copyWith(
                  hintText: '',
                ),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Email : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: myTextFieldDecorationLight.copyWith(
                  hintText: '',
                ),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Username : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: myTextFieldDecorationLight.copyWith(
                  hintText: '',
                ),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Password : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: myTextFieldDecorationLight.copyWith(
                  hintText: '',
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
                title: 'REGISTER',
                onPressed: () async {
                  print('REGISTER button click');
                },
              ),
            ],
          )),
    );
  }
}
