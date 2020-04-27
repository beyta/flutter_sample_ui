import 'package:flutter/material.dart';
import 'package:fluttersampleui/styles/main_style.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

class DecimalInputPage extends StatefulWidget {
  static const String id = 'DecimalInputPage';

  @override
  _DecimalInputPageState createState() => _DecimalInputPageState();
}

class _DecimalInputPageState extends State<DecimalInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decimal Input Page'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    var moneyController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ',');

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: Center(
            child: TextField(
              controller: moneyController,
              textAlign: TextAlign.center,
              decoration:
                  myTextFieldDecorationDark.copyWith(hintText: 'RM 0.00'),
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
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
}
