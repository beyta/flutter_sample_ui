import 'package:flutter/material.dart';
import 'package:fluttersampleui/styles/main_style.dart';
import 'package:fluttersampleui/functions/validator.dart';

class EmailRegexPage extends StatefulWidget {
  static const String id = 'EmailRegexPage';

  @override
  _EmailRegexPageState createState() => _EmailRegexPageState();
}

class _EmailRegexPageState extends State<EmailRegexPage> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Regex Validation'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: Center(
            child: TextField(
              decoration: myTextFieldDecorationDark.copyWith(
                  hintText: 'Enter Email Address'),
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                ValidatorInputFormatter(
                    editingValidator: EmailEditingRegexValidator()),
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
        ),
        _buildDoneButton(context),
        RaisedButton(
          color: Colors.blue,
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    bool valid = EmailSubmitRegexValidator().isValid(_value);

    //You can enhance the flatButton and add your function to trigger when click.
    String btnText = '';
    if (valid) {
      btnText = 'Valid Email Address';
    } else {
      btnText = 'Invalid Email Address';
    }

    return Container(
      constraints: BoxConstraints.expand(width: double.infinity, height: 60.0),
      child: FlatButton(
        color: Colors.green[400],
        child: Text(btnText,
            style: TextStyle(
                fontSize: 20.0,
                color: valid ? Colors.green : Colors.red)),
      ),
    );
  }
}
